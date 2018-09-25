//
//  UITextField+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (MMH)


/**
 *  选中所有文本
 */
- (void)selectAllText;

/**
 *  选中range范围中的文本
 */
- (void)setSelectedRange:(NSRange)range;


/**<设置UIToolBar 有 取消，和确认按钮*/
-(void)showBarCallback:(void(^)(UITextField *textField,NSInteger buttonIndex))callBack;


@end

NS_ASSUME_NONNULL_END
