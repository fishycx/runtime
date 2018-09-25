//
//  NSTimer+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (MMH)

/**
 模拟iOS10系统timer的block方法
 内存安全的timer，不用invlidate方法 也能使内存释放。
 注意：block的retain cycle
 */
+ (NSTimer *)mmh_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)yesOrNo;

+ (NSTimer *)mmh_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))block repeats:(BOOL)yesOrNo;

@end
