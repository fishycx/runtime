//
//  MMHFPSLabel.m
//  MamHao
//
//  Created by 咸鱼 on 16/3/4.
//  Copyright © 2016年 Mamahao. All rights reserved.
//

#import "MMHFPSLabel.h"
#import <objc/runtime.h>

#define kSize CGSizeMake(55, 22)

@implementation MMHFPSLabel {
    UIFont *_font;
    UIFont *_subFont;
    NSUInteger _count;
    CADisplayLink *_link;
    NSTimeInterval _lastTime;
}


#pragma mark - Init


- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size = kSize;
    }
    self = [super initWithFrame:frame];
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.textAlignment = NSTextAlignmentCenter;
    self.userInteractionEnabled = NO;
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
    
    _font = [UIFont fontWithName:@"Menlo" size:14];
    if (_font) {
        _subFont = [UIFont fontWithName:@"Menlo" size:4];
    } else {
        _font = [UIFont fontWithName:@"Courier" size:14];
        _subFont = [UIFont fontWithName:@"Courier" size:4];
    }
    
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return kSize;
}


#pragma mark - Action


- (void)tick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = link.timestamp;
    float fps = _count / delta;
    _count = 0;
    
    CGFloat progress = fps / 60.0;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d FPS", (int)round(fps)]];
    [text addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, text.length - 3)];
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(text.length - 3, 3)];
    [text addAttribute:NSFontAttributeName value:_font range:NSMakeRange(0, text.length)];
    [text addAttribute:NSFontAttributeName value:_subFont range:NSMakeRange(text.length - 4, 1)];
    
    self.attributedText = text;
}


#pragma mark - Dealloc


- (void)dealloc {
    [_link invalidate];
}




@end
