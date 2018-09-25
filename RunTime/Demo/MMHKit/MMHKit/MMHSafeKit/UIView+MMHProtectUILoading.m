//
//  UIView+MMHProtectUILoading.m
//  MamHao
//
//  Created by lixuezhi on 2017/7/5.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import "UIView+MMHProtectUILoading.h"
#import "NSObject+MMHSwizzle.h"
#import <objc/runtime.h>
#import "MMHMacro.h"

// 在主线程中执行
#define dispatch_main_async_safety(block)\
    if ([NSThread isMainThread]) {\
        block();\
    } else {\
        DLog(@"😓没有在主线程中更新UI！！！，---类名：%@", self);\
    dispatch_async(dispatch_get_main_queue(), block);\
}

@implementation UIView (MMHProtectUILoading)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self mmhSwizzleMethod:@selector(setNeedsLayout) withMethod:@selector(mmh_setNeedsLayout) error:nil];
        [self mmhSwizzleMethod:@selector(setNeedsDisplay) withMethod:@selector(mmh_setNeedsDisplay) error:nil];
        [self mmhSwizzleMethod:@selector(setNeedsDisplayInRect:) withMethod:@selector(mm_setNeedsDisplayInRect:) error:nil];
    });
}

- (void)mmh_setNeedsLayout {
    if ([self isKindOfClass:NSClassFromString(@"FigSubtitleCALayer")] ||
        [self isKindOfClass:NSClassFromString(@"FigVideoContainerLayer")]) {
        [self mmh_setNeedsLayout];
    } else {
        dispatch_main_async_safety(^(){
            [self mmh_setNeedsLayout];
        })
    }
}

- (void)mmh_setNeedsDisplay {
    if ([self isKindOfClass:NSClassFromString(@"FigSubtitleCALayer")] ||
        [self isKindOfClass:NSClassFromString(@"FigVideoContainerLayer")]) {
        [self mmh_setNeedsDisplay];
    } else {
        dispatch_main_async_safety(^(){
            [self mmh_setNeedsDisplay];
        })
    }
}

- (void)mm_setNeedsDisplayInRect:(CGRect)r {
    if ([self isKindOfClass:NSClassFromString(@"FigSubtitleCALayer")] ||
        [self isKindOfClass:NSClassFromString(@"FigVideoContainerLayer")]) {
        [self mm_setNeedsDisplayInRect:r];
    } else {
        dispatch_main_async_safety(^(){
            [self mm_setNeedsDisplayInRect:r];
        })
    }
}

@end

