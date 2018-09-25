//
//  MMHRelative.m
//  MMHKit
//
//  Created by DevilSun on 2018/3/23.
//  Copyright © 2018年 Mamhao. All rights reserved.
//

#import "MMHRelative.h"
#import "MMHMacro.h"
#import "UIScreen+MMH.h"

CGFloat mmh_screen_scale()
{
    return ([UIScreen instancesRespondToSelector:@selector(scale)]?[[UIScreen mainScreen] scale]:(1.0f));
}

CGFloat mmh_screen_width()
{
    return ([[UIScreen mainScreen] bounds].size.width);
}

CGFloat mmh_screen_height()
{
    return ([[UIScreen mainScreen] bounds].size.height);
}

CGFloat mmh_pixel()
{
    static CGFloat pixel = 1.0f;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pixel = 1.0f / mmh_screen_scale();
    });
    return pixel;
}

CGFloat MMHFloat(CGFloat floatValue)
{
    return MMHFloatWithPadding(floatValue, 0.0f);
}

CGFloat MMHFloatWithPadding(CGFloat floatValue, CGFloat padding)
{
    CGFloat currentScreenWidth = mmh_screen_width() - padding;
    CGFloat standardScreenWidth = 375.0f - padding;
    return floorf(floatValue / standardScreenWidth * currentScreenWidth);
}

CGPoint MMHPoint(CGPoint pointValue)
{
    return CGPointMake(MMHFloat(pointValue.x), MMHFloat(pointValue.y));
}

CGSize MMHSize(CGSize sizeValue)
{
    return CGSizeMake(MMHFloat(sizeValue.width), MMHFloat(sizeValue.height));
}

CGRect MMHRect(CGRect rectValue)
{
    return CGRectMake(MMHFloat(rectValue.origin.x), MMHFloat(rectValue.origin.y), MMHFloat(rectValue.size.width), MMHFloat(rectValue.size.height));
}

CGPoint MMHPointMake(CGFloat x, CGFloat y)
{
    return CGPointMake(MMHFloat(x), MMHFloat(y));
}

CGSize MMHSizeMake(CGFloat width, CGFloat height)
{
    return CGSizeMake(MMHFloat(width), MMHFloat(height));
}

CGRect MMHRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    return CGRectMake(MMHFloat(x), MMHFloat(y), MMHFloat(width), MMHFloat(height));
}

UIEdgeInsets UIEdgeInsetsWithTop(CGFloat top)
{
    return UIEdgeInsetsMake(top, 0.0f, 0.0f, 0.0f);
}

UIEdgeInsets UIEdgeInsetsWithLeft(CGFloat left)
{
    return UIEdgeInsetsMake(0.0f, left, 0.0f, 0.0f);
}

UIEdgeInsets UIEdgeInsetsWithBottom(CGFloat bottom)
{
    return UIEdgeInsetsMake(0.0f, 0.0f, bottom, 0.0f);
}

UIEdgeInsets UIEdgeInsetsWithRight(CGFloat right)
{
    return UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, right);
}

UIEdgeInsets MMHEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
{
    return UIEdgeInsetsMake(MMHFloat(top), MMHFloat(left), MMHFloat(bottom), MMHFloat(right));
}

extern CGFloat MMHFontSize(CGFloat pointSize)
{
    MMHScreenMode model = [UIScreen currentScreenMode];
    switch (model) {
        case MMHScreenModeIPhone4SOrEarlier:
        case MMHScreenModeIPhone5Series:
            return MMHFloat(pointSize + 2.0f);
            break;
        case MMHScreenModeIPhone6:
        case MMHScreenModeIPhone6Plus:
        case MMHScreenModeIPhoneX:
            return MMHFloat(pointSize);
            break;
        case MMHScreenModeIPadPortrait:
        case MMHScreenModeIPadLandscape:
        case MMHScreenModeUnknown:
            return MMHFloat(pointSize);
        default:
            break;
    }
}

UIFont *MMHFontOfSize(CGFloat pointSize)
{
    return [UIFont systemFontOfSize:MMHFontSize(pointSize)];
}

CGSize CGSizePixelToPoint(CGSize sizeOfPixel)
{
    CGSize sizeOfPoint = sizeOfPixel;
    sizeOfPoint.width /= kScreenScale;
    sizeOfPoint.height /= kScreenScale;
    return sizeOfPoint;
}

CGSize CGSizePointToPixel(CGSize sizeOfPoint)
{
    CGSize sizeOfPixel = sizeOfPoint;
    sizeOfPixel.width *= kScreenScale;
    sizeOfPixel.height *= kScreenScale;
    return sizeOfPixel;
}

@implementation MMHRelative

@end
