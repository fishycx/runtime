//
//  MMHRelative.h
//  MMHKit
//
//  Created by DevilSun on 2018/3/23.
//  Copyright © 2018年 Mamhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern CGFloat mmh_screen_scale(void);
extern CGFloat mmh_screen_width(void);
extern CGFloat mmh_screen_height(void);
extern CGFloat mmh_pixel(void);

extern CGFloat MMHFloat(CGFloat floatValue);
extern CGFloat MMHFloatWithPadding(CGFloat floatValue, CGFloat padding);
extern CGPoint MMHPoint(CGPoint pointValue);
extern CGSize MMHSize(CGSize sizeValue);
extern CGRect MMHRect(CGRect rectValue);

extern CGPoint MMHPointMake(CGFloat x, CGFloat y);
extern CGSize MMHSizeMake(CGFloat width, CGFloat height);
extern CGRect MMHRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height);

extern UIEdgeInsets UIEdgeInsetsWithTop(CGFloat top);
extern UIEdgeInsets UIEdgeInsetsWithLeft(CGFloat left);
extern UIEdgeInsets UIEdgeInsetsWithBottom(CGFloat bottom);
extern UIEdgeInsets UIEdgeInsetsWithRight(CGFloat right);
extern UIEdgeInsets MMHEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);

extern CGFloat MMHFontSize(CGFloat pointSize);
extern UIFont *MMHFontOfSize(CGFloat pointSize);

extern CGSize CGSizePixelToPoint(CGSize sizeOfPixel);
extern CGSize CGSizePointToPixel(CGSize sizeOfPoint);

@interface MMHRelative : NSObject

@end
