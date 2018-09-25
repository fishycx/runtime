//
//  UIScreen+MMH.m
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/19.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import "UIScreen+MMH.h"

@implementation UIScreen (MMH)


+ (MMHScreenMode)currentScreenMode {
    CGSize currentSize = [UIScreen mainScreen].bounds.size;
    
    if (CGSizeEqualToSize(currentSize, CGSizeMake(320.0f, 480.0f))) {
        return MMHScreenModeIPhone4SOrEarlier;
    }
    else if (CGSizeEqualToSize(currentSize, CGSizeMake(320.0f, 568.0f))) {
        return MMHScreenModeIPhone5Series;
    }
    else if (CGSizeEqualToSize(currentSize, CGSizeMake(375.0f, 667.0f))) {
        return MMHScreenModeIPhone6;
    }
    else if (CGSizeEqualToSize(currentSize, CGSizeMake(414.0f, 736.0f))) {
        return MMHScreenModeIPhone6Plus;
    }
    else if (CGSizeEqualToSize(currentSize, CGSizeMake(375.0f, 812.0f))) {
        return MMHScreenModeIPhoneX;
    }
    else if (CGSizeEqualToSize(currentSize, CGSizeMake(768.0f, 1024.0f))) {
        return MMHScreenModeIPadPortrait;
    }
    else if (CGSizeEqualToSize(currentSize, CGSizeMake(1024.0f, 768.0f))) {
        return MMHScreenModeIPadLandscape;
    }
    return MMHScreenModeUnknown;
}


@end
