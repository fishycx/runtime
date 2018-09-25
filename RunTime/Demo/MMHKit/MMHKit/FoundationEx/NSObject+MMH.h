//
//  NSObject+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MMH)


/**
 *  判断一个对象是否为null，如果对象本身是数组，字符串，也会判断其长度
 */
- (BOOL)notNilOrEmpty;

/**
 *  以字符串的形式返回类名
 */
+ (nullable NSString *)className;


@end

NS_ASSUME_NONNULL_END