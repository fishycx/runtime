//
//  NSMutableArray+MMHSWizzleMRC.m
//  MamHao
//
//  Created by lixuezhi on 2017/6/22.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import "NSMutableArray+MMHSWizzleMRC.h"
#import "NSObject+MMHSwizzle.h"
#import <objc/runtime.h>

@implementation NSMutableArray (MMHSWizzleMRC)

+ (void)load {
    /**
     * param "__NSArrayM": 初始化后的可变数组类名
     */
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArrayM") mmhSwizzleMethod:@selector(objectAtIndex:) withMethod:@selector(safeMRC_objectAtIndex:) error:nil];
    });
}

- (id)safeMRC_objectAtIndex:(NSUInteger)index {
    @autoreleasepool {
        if (index >= self.count) {
            NSAssert(NO, @"---index越界！！！");
            return nil;
        }
        return [self safeMRC_objectAtIndex:index];
    }
}

@end
