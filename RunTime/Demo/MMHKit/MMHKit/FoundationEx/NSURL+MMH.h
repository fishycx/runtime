//
//  NSURL+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/14.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (MMH)

/**
 *  将url字符串中的参数转换成字典返回
 */
- (NSDictionary *)queryParams;

@end

NS_ASSUME_NONNULL_END
