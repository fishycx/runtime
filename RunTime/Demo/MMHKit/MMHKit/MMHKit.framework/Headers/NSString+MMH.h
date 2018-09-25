//
//  NSString+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MMH)


#pragma mark - 常用加密算法


/**
 *  返回小写的md5字符串
 */
- (nullable NSString *)md5String;

/**
 *  返回小写的sha1字符串
 */
- (nullable NSString *)sha1String;


#pragma mark - 编码，解码方法


/**
 *  苹果iOS7自带的base64编码方法
 */
- (nullable NSString *)base64EncodedString;

/**
 *  苹果iOS7自带的base64解码方法
 */
+ (nullable NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 *  URL编码
 */
- (nullable NSString *)stringByURLEncode;

/**
 *  URL解码
 */
- (nullable NSString *)stringByURLDecode;


#pragma mark - 常用方法


/**
 *  计算NSString宽高相关方法
 */
- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;
- (CGFloat)widthForFont:(UIFont *)font;
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;
- (CGSize)sizeWithCalcFont:(UIFont *)font;
- (CGSize)sizeWithCalcFont:(UIFont *)font constrainedToSize:(CGSize)size;

/**
 *  返回NSMutableAttributedString 参数 font color linespace
 */
//- (NSMutableAttributedString *)attrributeStringWithFont:(UIFont *)font color:(UIColor *)color lineSpace:(CGFloat)lineSpace;

/**
 *  去除字符串中的空格，换行符
 */
- (nullable NSString *)stringByTrim;

/**
 *  返回UUID字符串，苹果目前允许使用的唯一标识
 */
+ (nullable NSString *)stringWithUUID;

/**
 *  将NSString转化成NSURL
 */
- (nullable NSURL *)urlValue;


#pragma mark - 常用校验

/**
 *  邮箱格式校验
 */
- (BOOL)isValidEmail;
+ (BOOL)isValidEmail:(NSString *)email;

/**
 *  手机号码校验
 */
- (BOOL)isValidPhone;
+ (BOOL)isValidPhone:(NSString *)phone;
- (BOOL)isValidNumber;

/**< 隐藏手机号码中间4位*/
- (NSString *)encryptPhoneNumber;



@end

NS_ASSUME_NONNULL_END


