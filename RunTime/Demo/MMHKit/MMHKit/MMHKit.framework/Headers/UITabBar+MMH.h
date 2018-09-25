//
//  UITabBar+MMH.h
//  MamHao
//
//  Created by DevilSun on 2017/2/6.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (MMH)

- (void)showBadgeValue:(NSString *)badgeValue index:(long)index;

- (void)hideBadgeWithIndex:(long)index;

/**< 获取对应Item的frame*/
- (CGRect)getItemFrameWithIndex:(NSInteger)index;

@end
