//
//  YCXOperation.m
//  NSOperationQueueTest
//
//  Created by fishycx on 2018/8/27.
//  Copyright © 2018年 mamahao. All rights reserved.
//

#import "YCXOperation.h"

@implementation YCXOperation

- (void)main {
    if (!self.isCancelled) {
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---%@", [NSThread currentThread]);
        }
    }
}

@end
