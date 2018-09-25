//
//  UIColor+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


NS_ASSUME_NONNULL_BEGIN

@interface UIColor (MMH)


/**
 *  16进制颜色转换成UIColor
 */
+ (nullable UIColor *)colorWithHexString:(NSString *)string;
+ (nullable UIColor *)colorWithHexString:(NSString *)string alpha:(CGFloat)alpha;
+ (nullable UIColor *)randomColor;

@end

NS_ASSUME_NONNULL_END
