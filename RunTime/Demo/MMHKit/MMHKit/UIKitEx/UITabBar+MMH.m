//
//  UITabBar+MMH.m
//  MamHao
//
//  Created by DevilSun on 2017/2/6.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import "UITabBar+MMH.h"
#import "NSString+MMH.h"
#import "UIColor+MMH.h"
#import "UIView+MMH.h"
#import "MMHMacro.h"

static NSInteger const badgeTag = 1000;
static NSInteger const tabBarItemNum = 5;

@implementation UITabBar (MMH)

- (void)showBadgeValue:(NSString *)badgeValue index:(long)index {
    [self hideBadgeWithIndex:index];
    if (badgeValue == nil) {
        return;
    }
    UILabel *badgeView = [[UILabel alloc] init];
    badgeView.font = [UIFont systemFontOfSize:10.0f];
    badgeView.textAlignment = NSTextAlignmentCenter;
    badgeView.textColor = [UIColor whiteColor];
    badgeView.tag = index + badgeTag;
    badgeView.text = badgeValue;
    
    if ([badgeValue integerValue] > 99) {
        badgeView.text = @"99+";
    }
    CGFloat badgeValueWidth = [badgeView.text widthForFont:badgeView.font];
    badgeView.width = badgeValueWidth + 10 > 15 ? badgeValueWidth + 10 : 15 ;
    CGRect itemFrame = [self getItemFrameWithIndex:index];
    badgeView.frame = CGRectMake(CGRectGetMidX(itemFrame)+6, 3, badgeView.width, 15); // 小数会造成模糊，强转只是去掉小说点后位数，不会四舍五入
    badgeView.layer.cornerRadius = 7.5;
    badgeView.clipsToBounds = YES;
    badgeView.backgroundColor = [UIColor colorWithHexString:@"ff4d61"];;
    [self addSubview:badgeView];
    
}

- (void)hideBadgeWithIndex:(long)index {
    if ([self viewWithTag:index + badgeTag])
    {
        [[self viewWithTag:index + badgeTag] removeFromSuperview];
    }
}

- (CGRect)getItemFrameWithIndex:(NSInteger)index {
    //遍历出tabBarItems
    NSMutableArray *tabBarItems = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if ([NSStringFromClass([view class]) isEqualToString:@"UITabBarButton"]) {
            [tabBarItems addObject:view];
        }
    }
    //根据frame的X从小到大对tabBarItems进行排序
    NSArray *sortedTabBarItems= [tabBarItems sortedArrayUsingComparator:^NSComparisonResult(UIView *view1, UIView *view2){
        return [@(view1.frame.origin.x) compare:@(view2.frame.origin.x)];
    }];
    //找到指定的tabBarItem 并优化其相对于屏幕的位置
    NSInteger i = 0;
    CGRect itemFrame = CGRectZero;
    for (UIView *view in sortedTabBarItems) {
        if (index == i) {
            itemFrame = view.frame;
            itemFrame.origin.y = kScreenHeight - itemFrame.size.height;
            break;
        }
        i++;
    }
    
    return itemFrame;
}

@end

