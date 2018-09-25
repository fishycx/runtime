//
//  UIButton+MMHMultipleClicks.m
//  MamHao
//
//  Created by lixuezhi on 2017/6/13.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import "UIButton+MMHMultipleClicks.h"
#import "NSObject+MMHSwizzle.h"
#import <objc/runtime.h>

static const char *UIButton_acceptEventTime = "UIButton_acceptEventTime";
static const char *UIButton_acceptEventInterval = "UIButton_acceptEventInterval";

@implementation UIButton (MMHMultipleClicks)

- (NSTimeInterval)acceptEventTime {
    return [objc_getAssociatedObject(self, UIButton_acceptEventTime) doubleValue];
}

- (void)setAcceptEventTime:(NSTimeInterval)acceptEventTime {
    objc_setAssociatedObject(self, UIButton_acceptEventTime, @(acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)acceptEventInterval {
    return [objc_getAssociatedObject(self, UIButton_acceptEventInterval) doubleValue];
}

- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval {
    objc_setAssociatedObject(self, UIButton_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load {
    [self mmhSwizzleMethod:@selector(sendAction:to:forEvent:) withMethod:@selector(mmh_sendAction:to:forEvent:) error:nil];
}

- (void)mmh_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSDate date].timeIntervalSince1970 - self.acceptEventTime < self.acceptEventInterval) {
        return;
    }
    if (self.acceptEventInterval > 0) {
        self.acceptEventTime = [NSDate date].timeIntervalSince1970;
    }
    
    [self mmh_sendAction:action to:target forEvent:event];
}

@end
