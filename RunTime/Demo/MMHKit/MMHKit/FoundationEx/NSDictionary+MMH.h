//
//  NSDictionary+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (MMH)

/**
 * @abstract 判断字典是否有这个key
 */
- (BOOL)hasKey:(id)key;

/**
 * @abstract 将字典转换成NSData plist
 */
- (nullable NSData *)plistData;

/**
 * @abstract 将字典转换成NSString plist
 */
- (nullable NSString *)plistString;

/**
 * @abstract 将NSData plist转换为NSDictionary
 */
+ (nullable NSDictionary *)dictionaryWithPlistData:(NSData *)plist;

/**
 * @abstract 将NSString plist转换为NSDictionary
 */
+ (nullable NSDictionary *)dictionaryWithPlistString:(NSString *)plist;

/**
 * @abstract object对象以NSInteger类型返回
 */
- (NSInteger)integerForKey:(id)key;

/**
 * @abstract object对象以double类型返回
 */
- (double)doubleForKey:(NSString *)key;

/**
 * @abstract object对象以BOOL类型返回
 */
- (BOOL)boolForKey:(NSString *)key;

/**
 * @abstract object对象以NSString类型返回
 */
- (nullable NSString *)stringForKey:(id)key;

/**
 * @abstract object对象以NSDate类型返回
 */
- (nullable NSDate *)dateForKey:(NSString *)key;

/**
 * @abstract 去除字典中value为nil的值
 * @return 返回字典不存在value为nil
 */
- (NSDictionary *)wipeOffNilObject;

/**
 * @abstract 将字典转换成json
 */
- (NSString *)mmh_JSONString;

@end


@interface NSMutableDictionary (MMH)


/**
 *  将NSData plist转化成NSMutableDictionary
 */
+ (nullable NSMutableDictionary *)dictionaryWithPlistData:(NSData *)plist;

/**
 *  将NSString plist 转化成NSMutableDictionary
 */
+ (nullable NSMutableDictionary *)dictionaryWithPlistString:(NSString *)plist;

/**
 *  向字典添加一个对象，当对象为nil时，防止Crash
 */
- (void)setNullableObject:(id)anObject forKey:(id <NSCopying>)aKey;

@end

NS_ASSUME_NONNULL_END











