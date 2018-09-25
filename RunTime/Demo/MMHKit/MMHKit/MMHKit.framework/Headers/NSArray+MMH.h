//
//  NSArray+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (MMH)


/**
 * @abstract 返回目标索引的对象，如果超出了索引范围，返回nil，防止数组越界
 */
- (nullable id)objectOrNilAtIndex:(NSUInteger)index;

/**
 * @abstract 将NSData plist转换成数组
 */
+ (nullable NSArray *)arrayWithPlistData:(NSData *)plist;

/**
 * @abstract 将NSString plist转换成数组
 */
+ (nullable NSArray *)arrayWithPlistString:(NSString *)plist;

/**
 * @abstract 将数组转换成NSData plist
 */
- (nullable NSData *)plistData;

/**
 * @abstract 将数组转换成NSString plist
 */
- (nullable NSString *)plistString;

/**
 * @abstract 将数组转换成json字符串
 */
- (nullable NSString *)mmh_JSONString;

/**
 * @abstract 循环数组
 */
- (NSArray *)transformedArrayUsingHandler:(id (^)(id originalObject, NSUInteger index))handler;

@end


@interface NSMutableArray (MMH)

/**
 * @abstract 生成一个可变数组，且用NSNull占位
 */
+ (nullable NSMutableArray *)initNullArrayWithCapacity:(NSUInteger)capacity;

/**
 * @abstract 将NSData plist转换成可变数组
 */
+ (nullable NSMutableArray *)arrayWithPlistData:(NSData *)plist;

/**
 * @abstract 将NSString plist转换成可变数组
 */
+ (nullable NSMutableArray *)arrayWithPlistString:(NSString *)plist;

/**
 * @abstract 删除数组中第一个对象
 */
- (void)removeFirstObject;

/**
 * @abstract 替换数组中的某个对象
 */
- (BOOL)replaceObject:(id)anObject withObject:(id)anotherObject;

/**
 * @abstract 向数组添加一个对象，当对象为nil时，防止Crash
 */
- (void)addNullableObject:(id)anObject;


@end

NS_ASSUME_NONNULL_END




