//
//  MMHFPSLabel.h
//  MamHao
//
//  Created by 咸鱼 on 16/3/4.
//  Copyright © 2016年 Mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Show Screen FPS...
 *
 *  The maximum fps in OSX/iOS Simulator is 60.00.
 *  The maximum fps on iPhone is 59.97.
 *  The maxmium fps on iPad is 60.0.
 *
 *  CADisplayLink以特定模式注册到runloop后,每当屏幕显示内容刷新结束的时候,
 runloop就会向CADisplayLink指定的target发送一次指定的selector消息,
 CADisplayLink类对应的selector就会被调用一次。
 */
@interface MMHFPSLabel : UILabel


@end
