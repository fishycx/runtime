//
//  UIScrollView+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (MMH)

/**
 *  滚动到顶部
 */
- (void)scrollToTop;
- (void)scrollToTopAnimated:(BOOL)animated;

/**
 *  滚动到地部
 */
- (void)scrollToBottom;
- (void)scrollToBottomAnimated:(BOOL)animated;

/**
 *  滚动到最左边
 */
- (void)scrollToLeft;
- (void)scrollToLeftAnimated:(BOOL)animated;

/**
 *  滚动到最右边
 */
- (void)scrollToRight;
- (void)scrollToRightAnimated:(BOOL)animated;


@end

NS_ASSUME_NONNULL_END