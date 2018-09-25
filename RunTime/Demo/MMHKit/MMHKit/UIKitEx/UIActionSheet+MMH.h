//
//  UIActionSheet+MMH.h
//  MamHao
//
//  Created by DevilSun on 2017/12/20.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (MMH) <UIActionSheetDelegate>

+ (instancetype)actionSheetWithTitle:(NSString *)title
                        buttonTitles:(NSArray *)titleArray
                            callback:(void(^)(UIActionSheet *actionSheet,NSInteger buttonIndex))callbackBlock;

@end
