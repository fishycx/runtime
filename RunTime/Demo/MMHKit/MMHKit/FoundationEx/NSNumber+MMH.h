//
//  NSNumber+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (MMH)


/**
 *  字符床转换成NSNumber，yes，no，true，false会转成对应的Number，nil，NULL，<null>之类会转成null，16进制会转成对应的Number
 */
+ (nullable NSNumber *)numberWithString:(NSString *)string;


@end

NS_ASSUME_NONNULL_END