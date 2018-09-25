//
//  NSObject+MMHUnrecognizedSelectorSolveObject.m
//  MamHao
//
//  Created by lixuezhi on 2017/7/4.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import "NSObject+MMHUnrecognizedSelector.h"
#import "NSObject+MMHSwizzle.h"
#import <objc/runtime.h>

@interface MMHUnrecognizedSelectorSolveObject : NSObject

+ (instancetype)shareInstance;

@end

@implementation MMHUnrecognizedSelectorSolveObject

+ (instancetype)shareInstance {
    static MMHUnrecognizedSelectorSolveObject *unrecognizedSelectorSolveObject;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unrecognizedSelectorSolveObject = [[MMHUnrecognizedSelectorSolveObject alloc] init];
    });
    return unrecognizedSelectorSolveObject;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    class_addMethod(self, sel, (IMP)runtimeAddMehthod, "v@:@");
    return YES;
}

void runtimeAddMehthod(id self, SEL _cmd) {
    NSAssert(NO, @"--- unrecognized selector:- %@！！！", NSStringFromSelector(_cmd));
}

@end
    

@implementation NSObject (MMHUnrecognizedSelector)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self mmhUnrecognizedSelectorSwizzleMethod:@selector(forwardingTargetForSelector:) withMethod:@selector(mmh_forwardingTargetForSelector:) error:nil];
    });
}

//只拦截NSArray NSNull NSDictionary NSNumber四个类，其他的还是走系统的拦截机制
- (id)mmh_forwardingTargetForSelector:(SEL)aSelector {
    if ([self isKindOfClass:[NSArray class]] ||
        [self isKindOfClass:[NSNull class]] ||
        [self isKindOfClass:[NSDictionary class]] ||
        [self isKindOfClass:[NSNumber class]])
    {
        return [MMHUnrecognizedSelectorSolveObject shareInstance];
    } else {
        return [self mmh_forwardingTargetForSelector:aSelector];
    }
}

//只所以在这单独写个swizzle方法是因为NSObject+MMHSwizzle里面的方法还没添加上。
+ (BOOL)mmhUnrecognizedSelectorSwizzleMethod:(SEL)originSel withMethod:(SEL)altSel error:(NSError **)error {
#if OBJC_API_VERSION >= 2
    Method origMethod = class_getInstanceMethod(self, originSel);
    if (!origMethod) {
        return NO;
    }
    
    Method altMethod = class_getInstanceMethod(self, altSel);
    if (!altMethod) {
        return NO;
    }
    
    class_addMethod(self,
                    originSel,
                    class_getMethodImplementation(self, originSel),
                    method_getTypeEncoding(origMethod));
    class_addMethod(self,
                    altSel,
                    class_getMethodImplementation(self, altSel),
                    method_getTypeEncoding(altMethod));
    
    method_exchangeImplementations(origMethod, altMethod);
    return YES;
#else
   	//	Scan for non-inherited methods.
    Method directOriginalMethod = NULL, directAlternateMethod = NULL;
    
    void *iterator = NULL;
    struct objc_method_list *mlist = class_nextMethodList(self, &iterator);
    while (mlist) {
        int method_index = 0;
        for (; method_index < mlist->method_count; method_index++) {
            if (mlist->method_list[method_index].method_name == originSel) {
                assert(!directOriginalMethod);
                directOriginalMethod = &mlist->method_list[method_index];
            }
            if (mlist->method_list[method_index].method_name == altSel) {
                assert(!directAlternateMethod);
                directAlternateMethod = &mlist->method_list[method_index];
            }
        }
        mlist = class_nextMethodList(self, &iterator);
    }
    
    //	If either method is inherited, copy it up to the target class to make it non-inherited.
    if (!directOriginalMethod || !directAlternateMethod) {
        Method inheritedOriginalMethod = NULL, inheritedAlternateMethod = NULL;
        if (!directOriginalMethod) {
            inheritedOriginalMethod = class_getInstanceMethod(self, originSel);
            if (!inheritedOriginalMethod) {
                return NO;
            }
        }
        if (!directAlternateMethod) {
            inheritedAlternateMethod = class_getInstanceMethod(self, altSel);
            if (!inheritedAlternateMethod) {
                return NO;
            }
        }
        
        int hoisted_method_count = !directOriginalMethod && !directAlternateMethod ? 2 : 1;
        struct objc_method_list *hoisted_method_list = malloc(sizeof(struct objc_method_list) + (sizeof(struct objc_method)*(hoisted_method_count-1)));
        hoisted_method_list->obsolete = NULL;	// soothe valgrind - apparently ObjC runtime accesses this value and it shows as uninitialized in valgrind
        hoisted_method_list->method_count = hoisted_method_count;
        Method hoisted_method = hoisted_method_list->method_list;
        
        if (!directOriginalMethod) {
            bcopy(inheritedOriginalMethod, hoisted_method, sizeof(struct objc_method));
            directOriginalMethod = hoisted_method++;
        }
        if (!directAlternateMethod) {
            bcopy(inheritedAlternateMethod, hoisted_method, sizeof(struct objc_method));
            directAlternateMethod = hoisted_method;
        }
        class_addMethods(self, hoisted_method_list);
    }
    
    //	Swizzle.
    IMP temp = directOriginalMethod->method_imp;
    directOriginalMethod->method_imp = directAlternateMethod->method_imp;
    directAlternateMethod->method_imp = temp;
    
    return YES;
#endif
}


@end


