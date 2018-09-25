//
//  NSAttributedString+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/21.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (MMH)

/**
 * @abstract 计算NSAttributedString宽高相关方法
 */
- (CGSize)sizeForSize:(CGSize)size;

@end

@interface NSMutableAttributedString (MMH)

/**
 * @abstract 构建属性字符串方法
 */
+ (NSMutableAttributedString *)rangeLabelWithContent:(NSString *)content
                                       hltContentArr:(NSArray *)hltContentArr
                                            hltColor:(UIColor *)hltColor
                                         normolColor:(UIColor *)normolColor;
/**
 * @abstract 构建属性字符串方法
 */
+ (NSMutableAttributedString *)rangeLabelWithContent:(NSString *)content
                                       hltContentArr:(NSArray *)hltContentArr
                                            hltColor:(UIColor *)hltColor
                                         normolColor:(UIColor *)normolColor
                                      setLineSpacing:(CGFloat)lindSpaceing;

/**
 * @abstract 将中括号中的文字改成高亮状态
 * 支持多个中括号
 */
+ (NSMutableAttributedString *)hightlightBracketsPackageString:(NSString *)content
                                            hltColor:(UIColor *)hltColor
                                         normolColor:(UIColor *)normolColor;

@end
