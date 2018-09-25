//
//  MMHTimestamp.m
//  MamHao
//
//  Created by Louis Zhu on 15/4/3.
//  Copyright (c) 2015年 Mamhao. All rights reserved.
//

#import "MMHTimestamp.h"


@implementation MMHTimestamp


+ (NSString *)timestampString
{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0lf", timeInterval * 1000.0];
}
@end
