//
//  NSObject+MMH.m
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import "NSObject+MMH.h"

@implementation NSObject (MMH)


- (BOOL)notNilOrEmpty {
    if ((NSNull *)self == [NSNull null]) {
        return NO;
    }
    if ([self respondsToSelector:@selector(count)]) {
        if ([(id)self count] == 0) {
            return NO;
        }
    }
    if ([self respondsToSelector:@selector(length)]) {
        if ([(id)self length] == 0) {
            return NO;
        }
    }
    return YES;
}

+ (NSString *)className {
    return NSStringFromClass(self);
}


@end
