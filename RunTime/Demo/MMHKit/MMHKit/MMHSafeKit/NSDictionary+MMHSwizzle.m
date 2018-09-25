//
//  NSDictionary+MMHSwizzle.m
//  MamHao
//
//  Created by lixuezhi on 2017/5/22.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import "NSDictionary+MMHSwizzle.h"
#import "NSObject+MMHSwizzle.h"
#import <objc/runtime.h>

@implementation NSDictionary (MMHSwizzle)

@end


@implementation NSMutableDictionary (MMHSwizzle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSDictionaryM") mmhSwizzleMethod:@selector(setObject:forKey:) withMethod:@selector(mmh_setObject:forKey:) error:nil];
        [objc_getClass("__NSDictionaryM") mmhSwizzleMethod:@selector(removeObjectForKey:) withMethod:@selector(mmh_removeObjectForKey:) error:nil];
    });
}

- (void)mmh_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (!anObject) {
        NSAssert(NO, @"---obj为nil！！！");
        return;
    }
    if (!aKey) {
        NSAssert(NO, @"---key为nil！！！");
        return;
    }
    [self mmh_setObject:anObject forKey:aKey];
}

- (void)mmh_removeObjectForKey:(id)aKey {
    if (!aKey) {
        NSAssert(NO, @"---key为nil！！！");
        return;
    }
    [self mmh_removeObjectForKey:aKey];
}

@end
