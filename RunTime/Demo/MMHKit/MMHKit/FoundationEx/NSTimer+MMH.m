//
//  NSTimer+MMH.m
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import "NSTimer+MMH.h"

@implementation NSTimer (MMH)

+ (NSTimer *)mmh_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))block repeats:(BOOL)yesOrNo
{
    NSParameterAssert(block != nil);
    return [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(bk_executeBlockFromTimer:) userInfo:[block copy] repeats:yesOrNo];
}

+ (NSTimer *)mmh_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))block repeats:(BOOL)yesOrNo {
    NSParameterAssert(block != nil);
    return [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(bk_executeBlockFromTimer:) userInfo:[block copy] repeats:yesOrNo];
}


+ (void)bk_executeBlockFromTimer:(NSTimer *)aTimer {
    void (^block)(void) = [aTimer userInfo];
    if (block) block();
}


@end
