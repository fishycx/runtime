//
//  NSData+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MMH)


/**
 *  返回小写的md5字符串
 */
- (NSString *)md5String;

/**
 *  返回小写的sha1字符串
 */
- (NSString *)sha1String;

/**
 *  使用苹果iOS7自带的base64方法编码
 *
 *  @return 返回base64编码后的内容
 */
- (NSString *)base64EncodedString;

/**
 *  使用苹果iOS7自带的base64方法解码
 *
 *  @param base64EncodedString 编码字符串内容
 *
 *  @return 返回解码后的NSData
 */
+ (NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 *  在mainBundle中找到文件，以NSData类型返回（类似[UIImage imageNamed:]）
 *
 *  @param name 文件名
 *
 *  @return NSData
 */
+ (NSData *)dataNamed:(NSString *)name;


@end

