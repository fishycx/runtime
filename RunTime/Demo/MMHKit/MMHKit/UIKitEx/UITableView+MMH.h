//
//  UITableView+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (MMH)

/**
 *  UITableView滚动方法，将NSIndexPath参数封装，方便调用
 */
- (void)scrollToRow:(NSUInteger)row inSection:(NSUInteger)section atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

/**
 *  UITableViewRow的添加，刷新，删除方法，将NSIndexPath参数封装，方便调用
 */
- (void)insertRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;
- (void)reloadRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;
- (void)deleteRow:(NSUInteger)row inSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  UITableViewRow的添加，刷新，删除方法，将NSArray<NSIndexPath *>参数封装，方便调用
 */
- (void)insertRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;
- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;
- (void)deleteRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  UITableView Section的添加，刷新，删除方法，将NSIndexPath参数封装，方便调用
 */
- (void)insertSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;
- (void)reloadSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;
- (void)deleteSection:(NSUInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  取消所有UITableViewCell的选中状态
 */
- (void)clearSelectedRowsAnimated:(BOOL)animated;


@end

NS_ASSUME_NONNULL_END
