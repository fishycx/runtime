//
//  NSArray+MMHSwizzle.m
//  MamHao
//
//  Created by lixuezhi on 2017/5/19.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import "NSArray+MMHSwizzle.h"
#import "NSObject+MMHSwizzle.h"
#import <objc/runtime.h>

@implementation NSArray (MMHSwizzle)

+ (void)load {
    /**
     * NSArray不同的创建方式会产生不同的类簇，即不同的指针
     * param "__NSArray0": [[NSArray alloc] init], @[] --> (空数组)
     * param "__NSArrayI": 初始化后的不可变数组类名都 @[@1, @2]
     * param "__NSSingleObjectArrayI": 初始化后的不可变数组类名且一个元素 @[1]
     * param "__NSArrayM": 初始化后的可变数组类名
     */
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArray0") mmhSwizzleMethod:@selector(objectAtIndex:) withMethod:@selector(mmh_objectAtIndex:) error:nil];
        [objc_getClass("__NSSingleObjectArrayI") mmhSwizzleMethod:@selector(objectAtIndex:) withMethod:@selector(mmh_objectAtIndex:) error:nil];
        [objc_getClass("__NSArrayI") mmhSwizzleMethod:@selector(objectAtIndex:) withMethod:@selector(mmh_objectAtIndex:) error:nil];
    });
}

- (id)mmh_objectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        NSAssert(NO, @"---index越界！！！");
        return nil;
    }
    return [self mmh_objectAtIndex:index];
}

@end


@implementation NSMutableArray (MMHSwizzle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArrayM") mmhSwizzleMethod:@selector(insertObject:atIndex:) withMethod:@selector(mmh_insertObject:atIndex:) error:nil];
        [objc_getClass("__NSArrayM") mmhSwizzleMethod:@selector(removeObjectAtIndex:) withMethod:@selector(mmh_removeObjectAtIndex:) error:nil];
        [objc_getClass("__NSArrayM") mmhSwizzleMethod:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(mmh_replaceObjectAtIndex:withObject:) error:nil];
    });
}

- (void)mmh_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject || index > self.count) {
        NSAssert(NO, @"---index越界或obj为nil！！！");
        return;
    }
    [self mmh_insertObject:anObject atIndex:index];
}

- (void)mmh_removeObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        NSAssert(NO, @"---index越界！！！");
        return;
    }
    [self mmh_removeObjectAtIndex:index];
}

- (void)mmh_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (!anObject || index >= self.count) {
        NSAssert(NO, @"---index越界或obj为nil！！！");
        return;
    }
    [self mmh_replaceObjectAtIndex:index withObject:anObject];
}

@end
