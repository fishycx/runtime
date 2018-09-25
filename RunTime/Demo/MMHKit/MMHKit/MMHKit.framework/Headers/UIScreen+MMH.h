//
//  UIScreen+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/19.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, MMHScreenMode) {
    MMHScreenModeIPhone4SOrEarlier,
    MMHScreenModeIPhone5Series,
    MMHScreenModeIPhone6,
    MMHScreenModeIPhone6Plus,
    MMHScreenModeIPhoneX,
    
    MMHScreenModeIPadPortrait,
    MMHScreenModeIPadLandscape,
    
    MMHScreenModeUnknown,
};

NS_ASSUME_NONNULL_BEGIN


@interface UIScreen (MMH)


+ (MMHScreenMode)currentScreenMode;


@end

NS_ASSUME_NONNULL_END
