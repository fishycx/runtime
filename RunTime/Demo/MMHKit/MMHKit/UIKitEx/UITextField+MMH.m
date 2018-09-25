//
//  UITextField+MMH.m
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import "UITextField+MMH.h"
#import "UIColor+MMH.h"
#import "MMHMacro.h"
#import <objc/runtime.h>

static char cancelCallbackBolckKey;
static char checkCallbackBlockKey;

@implementation UITextField (MMH)

- (void)selectAllText {
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}

-(void)showBarCallback:(void(^)(UITextField *textField,NSInteger buttonIndex))callBack{
    UIToolbar *toolbar = [self createInputAccessoryView];
    
    if (callBack){
        objc_setAssociatedObject(self, &cancelCallbackBolckKey, callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
        objc_setAssociatedObject(self, &checkCallbackBlockKey, callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    self.inputAccessoryView = toolbar;
}

#pragma mark 创建inputAccessoryView

-(UIToolbar *)createInputAccessoryView {
    UIBarButtonItem *cancleBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelClick)];
    cancleBtn.tintColor = [UIColor colorWithHexString:@"447ed8"];
    UIBarButtonItem *confirmBtn = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(checkClick)];
    confirmBtn.tintColor = [UIColor colorWithHexString:@"447ed8"];
    UIBarButtonItem *flexBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    toolBar.tintColor = [UIColor whiteColor];
    [toolBar setItems:@[cancleBtn,flexBtn,confirmBtn]];
    return toolBar;
}

-(void)cancelClick{
    void (^callBack)(UITextField *textField,NSInteger buttonIndex) = objc_getAssociatedObject(self, &cancelCallbackBolckKey);
    if (callBack){
        callBack(self,0);
    }
}

-(void)checkClick{
    void (^callBack)(UITextField *textField,NSInteger buttonIndex) = objc_getAssociatedObject(self, &checkCallbackBlockKey);
    if (callBack){
        callBack(self,1);
    }
}

@end
