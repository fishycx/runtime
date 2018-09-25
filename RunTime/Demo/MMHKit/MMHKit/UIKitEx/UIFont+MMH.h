//
//  UIFont+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (MMH)

/**
 *  加载,卸载自定义字体
 */
+ (BOOL)loadFontFromPath:(NSString *)path;
+ (void)unloadFontFromPath:(NSString *)path;

+ (UIFont *)systemFontOfCustomeSize:(CGFloat)fontSize;
+ (UIFont *)boldSystemFontOfCustomeSize:(CGFloat)fontSize;

/**
 * @abstract 计算字体高度
 */
- (CGFloat)fontHeight;

@end

NS_ASSUME_NONNULL_END
