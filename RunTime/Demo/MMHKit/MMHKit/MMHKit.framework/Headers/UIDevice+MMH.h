//
//  UIDevice+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (MMH)


@property (nonatomic, readonly) BOOL isPad;                ///<是否是iPad
@property (nonatomic, readonly) BOOL isSimulator;       ///<是否是模拟器
@property (nonatomic, readonly) BOOL isJailbroken;      ///<是否越狱

/**
 *  系统版本,例如：9.1
 */
+ (double)systemVersion;

/**
 *  设备详细类型，例如：iPhone 6s Plus
 */
+ (NSString *)deviceModel;

/**
 *  设备详细类型，例如：iPhone,iPod,iPad
 */
+ (NSString *)deviceClass;

/**
 *  设备ID，存在手机KeyChain中，卸载APP也不会改变
 *  Warning：钥匙串的key为APP的BundleID
 */
+ (NSString *)deviceID;


@end

NS_ASSUME_NONNULL_END
