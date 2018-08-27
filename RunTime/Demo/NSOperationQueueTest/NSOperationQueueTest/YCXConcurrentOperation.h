//
//  YCXConcurrentOperation.h
//  NSOperationQueueTest
//
//  Created by fishycx on 2018/8/27.
//  Copyright © 2018年 mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCXConcurrentOperation : NSOperation {
    BOOL executing;
    BOOL finished;
}

- (void)completeOperation;

@end
