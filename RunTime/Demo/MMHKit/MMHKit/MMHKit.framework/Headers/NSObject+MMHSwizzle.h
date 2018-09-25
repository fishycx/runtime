//
//  NSObject+MMHSwizzle.h
//  MamHao
//
//  Created by lixuezhi on 2017/5/18.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MMHSwizzle)

/**
 替换实例方法

 @param originSel 原始方法
 @param altSel 替换方法
 @param error 错误信息
 @return Yes为替换成功 NO则为失败
 */
+(BOOL)mmhSwizzleMethod:(SEL)originSel withMethod:(SEL)altSel error:(NSError **)error;

/**
 替换类方法

 @param originSel 原始方法
 @param altSel 替换方法
 @param error 错误信息
 @return Yes为替换成功 NO则为失败
 */
+(BOOL)mmhSwizzleClassMethod:(SEL)originSel withClassMethod:(SEL)altSel error:(NSError **)error;


/**
 用block替换实例方法

 @param originSel 原始方法
 @param block   block
 @param error   错误信息
 @return NSInvocation实例，携带方法信息
 */
+ (NSInvocation *)mmhSwizzleMethod:(SEL)originSel withBlock:(id)block error:(NSError **)error;

/**
 用block替换类方法

 @param originSel 原始方法
 @param block   block
 @param error   错误信息
 @return NSInvocation实例，携带方法信息
 */
+ (NSInvocation *)mmhSwizzleClassMethod:(SEL)originSel withBlock:(id)block error:(NSError **)error;

@end
