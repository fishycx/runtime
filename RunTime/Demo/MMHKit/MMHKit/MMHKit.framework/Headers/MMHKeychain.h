//
//  MMHKeychain.h
//  Mamahao
//
//  Created by Louis Zhu on 15/9/25.
//  Copyright (c) 2015年 Mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface MMHKeychain : NSObject

+ (void)saveData:(id)data forKey:(NSString *)key;
+ (id)dataForKey:(NSString *)key;
+ (void)deleteDataForKey:(NSString *)key;

@end


@interface UIDevice (MamHao)

+ (NSString *)deviceID;

@end
