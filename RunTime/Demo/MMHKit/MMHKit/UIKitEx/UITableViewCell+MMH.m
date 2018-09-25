//
//  UITableViewCell+MMH.m
//  MamHao
//
//  Created by DevilSun on 2017/12/20.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import "UITableViewCell+MMH.h"
#import "UIImage+MMH.h"
#import "UIColor+MMH.h"
#import "UIView+MMH.h"

@implementation UITableViewCell (MMH)

- (void)addBottomSeparatorLineWithMargin:(CGFloat)margin {
    UIImageView *bottomImageView = (UIImageView *)[self viewWithStringTag:@"bottomSeparatorTag"];
    if (!bottomImageView) {
        bottomImageView = [[UIImageView alloc] init];
        [bottomImageView setStringTag:@"bottomSeparatorTag"];
        [bottomImageView setImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"dcdcdc"] size:CGSizeMake(10., 10.)]];
        [bottomImageView setHighlightedImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"dcdcdc"] size:CGSizeMake(10., 10.)]];
    }
    [bottomImageView setFrame:CGRectMake(margin, CGRectGetHeight([self frame])-0.5, CGRectGetWidth([self frame])-2*margin, 0.5)];
    [self addSubview:bottomImageView];
}

@end
