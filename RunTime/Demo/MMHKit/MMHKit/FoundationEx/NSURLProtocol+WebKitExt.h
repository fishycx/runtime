//
//  NSURLProtocol+WebKitExt.h
//  MamHao
//
//  Created by DevilSun on 2017/5/27.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLProtocol (WebKitExt)

+ (void)wk_registerScheme:(NSString*)scheme;

+ (void)wk_unregisterScheme:(NSString*)scheme;

@end
