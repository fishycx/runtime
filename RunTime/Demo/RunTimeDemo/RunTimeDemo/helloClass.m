//
//  helloClass.m
//  RunTimeDemo
//
//  Created by fishycx on 2018/7/5.
//  Copyright © 2018年 mamahao. All rights reserved.
//

#import "helloClass.h"
#import <objc/runtime.h>
#import "RuntimeMethodHelper.h"

void functionForMethod(id self, SEL cmd)
{
    NSLog(@"Hello!");
}
Class functionForClassMethod(id self, SEL cmd)
{
      NSLog(@"Hi!");
      return [helloClass class];
}

@interface  helloClass()

@property (nonatomic, strong) RuntimeMethodHelper *helper;

@end


@implementation helloClass

- (instancetype)init {
    self = [super init];
    if (self) {
        self.helper = [RuntimeMethodHelper new];
    }
    return self;
}

#pragma mark - 1、动态方法解析


+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%d,%s", __LINE__, __func__);
    NSString *selString  = NSStringFromSelector(sel);
    if ([selString isEqualToString:@"hello"]) {
        class_addMethod(self, NSSelectorFromString(@"hello"), (IMP)functionForMethod, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
    
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@"%d,%s", __LINE__, __func__);
    NSString *selString  = NSStringFromSelector(sel);
    if ([selString isEqualToString:@"hi"]) {
        Class metaClass = objc_getMetaClass("helloClass");
        class_addMethod(metaClass, NSSelectorFromString(@"hi"), (IMP)functionForClassMethod, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

#pragma mark - 2、备用接收者

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%d,%s", __LINE__, __func__);
    NSString *selString  = NSStringFromSelector(aSelector);
    if ([selString isEqualToString:@"hello2"]) {
        return _helper;
    }
   return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - 3、完整消息转发

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%d,%s", __LINE__, __func__);
    if ([RuntimeMethodHelper instanceMethodSignatureForSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:_helper];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        if ([RuntimeMethodHelper instanceMethodSignatureForSelector:aSelector]) {
            signature = [RuntimeMethodHelper instanceMethodSignatureForSelector:aSelector];
        }
    }
    return signature;
}

@end
