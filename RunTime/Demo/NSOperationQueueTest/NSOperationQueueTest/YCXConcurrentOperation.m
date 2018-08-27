//
//  YCXConcurrentOperation.m
//  NSOperationQueueTest
//
//  Created by fishycx on 2018/8/27.
//  Copyright © 2018年 mamahao. All rights reserved.
//

#import "YCXConcurrentOperation.h"

@implementation YCXConcurrentOperation

- (instancetype)init {
    self = [super init];
    if (self) {
        executing = NO;
        finished = NO;
    }
    return self;
}

- (BOOL)isConcurrent {
    return YES;
}

- (BOOL)isExecuting {
    return executing;
}

- (BOOL)isFinished {
    return finished;
}

- (void)start {
    // Always check for cancellation before launching the task.
    if ([self isCancelled])
    {
        // Must move the operation to the finished state if it is canceled.
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    // If the operation is not canceled, begin executing the task.
    [self willChangeValueForKey:@"isExecuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
    
}
- (void)main {
    @try {
        
        // Do the main work of the operation here.
        
        [self completeOperation];
    }
    @catch(...) {
        // Do not rethrow exceptions.
    }
}


- (void)completeOperation {
    
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
    executing = NO;
    finished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];

}

@end
