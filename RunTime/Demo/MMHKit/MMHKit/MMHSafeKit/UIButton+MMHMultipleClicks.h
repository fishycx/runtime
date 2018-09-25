//
//  UIButton+MMHMultipleClicks.h
//  MamHao
//
//  Created by lixuezhi on 2017/6/13.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MMHMultipleClicks)

@property (nonatomic, assign) NSTimeInterval acceptEventTime;      //**< 点击的时间  */
@property (nonatomic, assign) NSTimeInterval acceptEventInterval;  //**< 点击的时间间隔  */

@end
