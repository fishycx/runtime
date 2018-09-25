//
//  UIApplication+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (MMH)


/**
 *  沙盒Documents目录
 */
@property (nonatomic, readonly) NSURL *documentsURL;
@property (nonatomic, readonly) NSString *documentsPath;

/**
 *  沙盒Caches目录
 */
@property (nonatomic, readonly) NSURL *cachesURL;
@property (nonatomic, readonly) NSString *cachesPath;

/**
 *  沙盒Library目录
 */
@property (nonatomic, readonly) NSURL *libraryURL;
@property (nonatomic, readonly) NSString *libraryPath;

@property (nullable, nonatomic, readonly) NSString *appBundleName;
@property (nullable, nonatomic, readonly) NSString *appBundleID;
@property (nullable, nonatomic, readonly) NSString *appVersion;
@property (nullable, nonatomic, readonly) NSString *appBuildVersion;


@end

NS_ASSUME_NONNULL_END
