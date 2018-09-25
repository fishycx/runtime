//
//  MMHFetchModel.h
//  MamHao
//
//  Created by SmartMin on 15/3/31.
//  Copyright (c) 2015年 Mamhao. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (MMHFetchModel)

- (NSArray *)modelArrayOfClass:(Class)modelClass;

@end


@interface MMHFetchModel : NSObject

// 仅供运行时解析JSON使用，子类不要调用此方法初始化对象
- (instancetype)initWithJSONDict:(NSDictionary *)dict;

// 子类需要覆盖此方法，提供model和JSON无法对应到的成员
- (NSDictionary *)modelKeyJSONKeyMapper; /**<-举个栗子 @{@"customizedId": @"id",@"customizedValue":@"value"};*/

- (void)injectJSONData:(id)dataObject;
- (instancetype)initWithJSONDict:(NSDictionary *)dict keyMap:(NSDictionary *)keyMap;
- (NSArray *)propertiesForCoding;
// equals to -propertiesForCoding by default
- (NSArray *)propertiesForDescription;

/**
 *  model 转字典
 *
 *  @return 字典
 */
- (NSDictionary *)convertToDictionary;

@end
