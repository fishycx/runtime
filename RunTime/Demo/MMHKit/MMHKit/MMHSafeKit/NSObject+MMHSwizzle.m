//
//  NSObject+MMHSwizzle.m
//  MamHao
//
//  Created by lixuezhi on 2017/5/18.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import "NSObject+MMHSwizzle.h"

#if TARGET_OS_IPHONE
    #import <objc/runtime.h>
    #import <objc/message.h>
#else
    #import <objc/objc-class.h>
#endif

#define SetNSErrorFor(FUNC, ERROR_VAR, FORMAT,...)	\
    if (ERROR_VAR) {	\
        NSString *errStr = [NSString stringWithFormat:@"%s: " FORMAT,FUNC,##__VA_ARGS__]; \
        *ERROR_VAR = [NSError errorWithDomain:@"NSCocoaErrorDomain" \
                                         code:-1	\
                                     userInfo:[NSDictionary dictionaryWithObject:errStr forKey:NSLocalizedDescriptionKey]]; \
    }
#define SetNSError(ERROR_VAR, FORMAT,...) SetNSErrorFor(__func__, ERROR_VAR, FORMAT, ##__VA_ARGS__)

#if OBJC_API_VERSION >= 2
    #define GetClass(obj)	object_getClass(obj)
#else
    #define GetClass(obj)	(obj ? obj->isa : Nil)
#endif


@implementation NSObject (MMHSwizzle)


+(BOOL)mmhSwizzleMethod:(SEL)originSel withMethod:(SEL)altSel error:(NSError **)error {
#if OBJC_API_VERSION >= 2
    Method origMethod = class_getInstanceMethod(self, originSel);
    if (!origMethod) {
#if TARGET_OS_IPHONE
        SetNSError(error, @"original method %@ not found for class %@", NSStringFromSelector(originSel), [self class]);
#else
        SetNSError(error, @"original method %@ not found for class %@", NSStringFromSelector(originSel), [self className]);
#endif
        return NO;
    }
    
    Method altMethod = class_getInstanceMethod(self, altSel);
    if (!altMethod) {
#if TARGET_OS_IPHONE
        SetNSError(error, @"alternate method %@ not found for class %@", NSStringFromSelector(altSel), [self class]);
#else
        SetNSError(error, @"alternate method %@ not found for class %@", NSStringFromSelector(altSel), [self className]);
#endif
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
    
    method_exchangeImplementations(class_getInstanceMethod(self, originSel), class_getInstanceMethod(self, altSel));
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
#if TARGET_OS_IPHONE
                SetNSError(error, @"original method %@ not found for class %@", NSStringFromSelector(originSel), [self class]);
#else
                SetNSError(error, @"original method %@ not found for class %@", NSStringFromSelector(originSel), [self className]);
#endif
                return NO;
            }
        }
        if (!directAlternateMethod) {
            inheritedAlternateMethod = class_getInstanceMethod(self, altSel);
            if (!inheritedAlternateMethod) {
#if TARGET_OS_IPHONE
                SetNSError(error, @"alternate method %@ not found for class %@", NSStringFromSelector(altSel), [self class]);
#else
                SetNSError(error, @"alternate method %@ not found for class %@", NSStringFromSelector(altSel), [self className]);
#endif
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


+(BOOL)mmhSwizzleClassMethod:(SEL)originSel withClassMethod:(SEL)altSel error:(NSError **)error {
    return [GetClass((id)self) mmhSwizzleMethod:originSel withMethod:altSel error:error];
}

+ (NSInvocation *)mmhSwizzleMethod:(SEL)originSel withBlock:(id)block error:(NSError **)error {
    IMP blockIMP = imp_implementationWithBlock(block);
    NSString *blockString = [NSString stringWithFormat:@"_mmh_block_%@_%p", NSStringFromSelector(originSel), block];
    SEL blockSEL = sel_registerName([blockString cStringUsingEncoding:NSUTF8StringEncoding]);
    
    Method originMethod = class_getInstanceMethod(self, originSel);
    const char *originSelMethodArgs = method_getTypeEncoding(originMethod);
    
    class_addMethod(self, blockSEL, blockIMP, originSelMethodArgs);
    
    NSMethodSignature *originSig = [NSMethodSignature signatureWithObjCTypes:originSelMethodArgs];
    NSInvocation *originInvocation = [NSInvocation invocationWithMethodSignature:originSig];
    
    [self mmhSwizzleMethod:originSel withMethod:blockSEL error:error];
    
    return originInvocation;
}

+ (NSInvocation *)mmhSwizzleClassMethod:(SEL)originSel withBlock:(id)block error:(NSError **)error {
    NSInvocation *invocation = [GetClass((id)self) mmhSwizzleClassMethod:originSel withBlock:block error:error];
    invocation.target = self;
    
    return invocation;
}

@end
