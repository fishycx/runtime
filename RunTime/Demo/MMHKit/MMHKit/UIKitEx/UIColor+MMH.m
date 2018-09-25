//
//  UIColor+MMH.m
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import "UIColor+MMH.h"


@implementation UIColor (MMH)


+ (UIColor *)colorWithHexString:(NSString *)string {
    return [self colorWithHexString:string alpha:1];
}

+ (UIColor *)colorWithHexString:(NSString *)string alpha:(CGFloat)alpha {
    NSString *pureHexString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([pureHexString length] < 6) {
        return [UIColor whiteColor];
    }
    
    // strip 0X or #
    if ([pureHexString hasPrefix:@"0X"]) {
        pureHexString = [pureHexString substringFromIndex:2];
    }
    if ([pureHexString hasPrefix:@"#"]) {
        pureHexString = [pureHexString substringFromIndex:1];
    }
    if ([pureHexString length] != 6) {
        return [UIColor whiteColor];
    }

    NSRange range = NSMakeRange(0, 2);
    NSString *rString = [pureHexString substringWithRange:range];
    range.location += range.length ;
    NSString *gString = [pureHexString substringWithRange:range];
    
    range.location += range.length ;
    NSString *bString = [pureHexString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0];
}

@end
