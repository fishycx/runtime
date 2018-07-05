//
//  RuntimeMethodHelper.m
//  RunTimeDemo
//
//  Created by fishycx on 2018/7/5.
//  Copyright © 2018年 mamahao. All rights reserved.
//

#import "RuntimeMethodHelper.h"

@implementation RuntimeMethodHelper

- (void)hello1 {
    NSLog(@"%d,%s", __LINE__, __func__);
}

@end
