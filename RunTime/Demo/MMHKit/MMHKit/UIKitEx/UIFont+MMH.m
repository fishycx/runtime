//
//  UIFont+MMH.m
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import "UIFont+MMH.h"
#import "NSString+MMH.h"
#import "MMHRelative.h"

@implementation UIFont (MMH)


+ (BOOL)loadFontFromPath:(NSString *)path {
    NSURL *url = [NSURL fileURLWithPath:path];
    CFErrorRef error;
    BOOL suc = CTFontManagerRegisterFontsForURL((__bridge CFTypeRef)url, kCTFontManagerScopeNone, &error);
    if (!suc) {
        NSLog(@"Failed to load font: %@", error);
    }
    return suc;
}

+ (void)unloadFontFromPath:(NSString *)path {
    NSURL *url = [NSURL fileURLWithPath:path];
    CTFontManagerUnregisterFontsForURL((__bridge CFTypeRef)url, kCTFontManagerScopeNone, NULL);
}

+ (UIFont *)systemFontOfCustomeSize:(CGFloat)fontSize {
    return [self systemFontOfSize:MMHFontSize(fontSize)];
}


+ (UIFont *)boldSystemFontOfCustomeSize:(CGFloat)fontSize {
    return [self boldSystemFontOfSize:MMHFontSize(fontSize)];
}

#pragma mark 计算高度
- (CGFloat)fontHeight {
    CGSize contentOfHeight = [@"计算" sizeWithCalcFont:self constrainedToSize:CGSizeMake(100, CGFLOAT_MAX)];
    return contentOfHeight.height;
}


@end
