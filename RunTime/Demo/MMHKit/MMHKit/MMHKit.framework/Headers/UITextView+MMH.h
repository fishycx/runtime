//
//  UITextView+MMH.h
//  MamHao
//
//  Created by DevilSun on 2017/3/24.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT double UITextView_PlaceholderVersionNumber;
FOUNDATION_EXPORT const unsigned char UITextView_PlaceholderVersionString[];

@interface UITextView (MMH)

@property (nonatomic, readonly) UILabel *placeholderLabel;

@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

@end
