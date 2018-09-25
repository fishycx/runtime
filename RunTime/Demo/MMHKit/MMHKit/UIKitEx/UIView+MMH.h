//
//  UIView+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MMH)

@property (nonatomic, strong) NSString *stringTag;

@property (nonatomic) CGFloat left;               ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;              ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;            ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;        ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;          ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;         ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;      ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;      ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;         ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;           ///< Shortcut for frame.size.


/**
 * @abstract 根据tag获取子视图对象
 */
- (nullable UIView *)viewWithStringTag:(NSString *)tag;

/**
 * @abstract 批量添加子视图
 */
- (void)addSubviews:(NSArray *)viewArray;

/**
 * @abstract 清除所有子视图
 */
- (void)removeAllSubviews;


@end

NS_ASSUME_NONNULL_END
