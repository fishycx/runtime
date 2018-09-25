//
//  NSString+MMHSwizzle.m
//  MamHao
//
//  Created by lixuezhi on 2017/5/18.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import "NSString+MMHSwizzle.h"
#import "NSObject+MMHSwizzle.h"
#import <objc/runtime.h>

@implementation NSString (MMHSwizzle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self mmhSwizzleMethod:@selector(substringFromIndex:) withMethod:@selector(mmh_substringFromIndex:) error:nil];
        [self mmhSwizzleMethod:@selector(substringToIndex:) withMethod:@selector(mmh_substringToIndex:) error:nil];
        [self mmhSwizzleMethod:@selector(substringWithRange:) withMethod:@selector(mmh_substringWithRange:) error:nil];
    });
}

- (NSString *)mmh_substringFromIndex:(NSUInteger)index {
    if (index <= self.length) {
        return [self mmh_substringFromIndex:index];
    }
    NSAssert(NO, @"---index越界！！！");
    return @"";
}

- (NSString *)mmh_substringToIndex:(NSUInteger)index {
    if (index <= self.length) {
        return [self mmh_substringToIndex:index];
    }
    NSAssert(NO, @"---index越界！！！");
    return @"";
}

- (NSString *)mmh_substringWithRange:(NSRange)range {
    NSRange safeRange = NSMakeRange(0, self.length);
    if (NSEqualRanges(safeRange, NSUnionRange(range, safeRange))) {
        return [self mmh_substringWithRange:range];
    }
    NSAssert(NO, @"---rang越界！！！");
    return @"";
}

@end

@implementation NSMutableString (MMHSwizzle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSCFString") mmhSwizzleMethod:@selector(appendString:) withMethod:@selector(mmh_appendString:) error:nil];
        [objc_getClass("__NSCFString") mmhSwizzleMethod:@selector(insertString:atIndex:) withMethod:@selector(mmh_insertString:atIndex:) error:nil];
    });
}

- (void)mmh_appendString:(NSString *)aString {
    if (!aString) {
        NSAssert(NO, @"---string为nil！！!");
        return;
    }
    [self mmh_appendString:aString];
}

- (void)mmh_insertString:(NSString *)aString atIndex:(NSUInteger)loc {
    if (loc > self.length) {
        NSAssert(NO, @"---index越界！！！");
        return;
    }
    if (!aString) {
        NSAssert(NO, @"---string为nil！！!");
        return;
    }
    [self mmh_insertString:aString atIndex:loc];
}

@end
