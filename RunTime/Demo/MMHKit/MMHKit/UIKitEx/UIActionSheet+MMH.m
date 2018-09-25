//
//  UIActionSheet+MMH.m
//  MamHao
//
//  Created by DevilSun on 2017/12/20.
//  Copyright © 2017年 Mamahao. All rights reserved.
//

#import "UIActionSheet+MMH.h"
#import <objc/runtime.h>

static char *ActionSheetCallBackBlockKey;
@implementation UIActionSheet (MMH)

+ (instancetype)actionSheetWithTitle:(NSString *)title buttonTitles:(NSArray *)titleArray callback:(void (^)(UIActionSheet *, NSInteger))callbackBlock{
    NSUInteger count = titleArray.count;
    NSString *cancelTitle = nil;
    NSString *otherTitle1 = nil;
    NSString *otherTitle2 = nil;
    NSString *otherTitle3 = nil;
    
    switch (count) {
        case 1:{
            cancelTitle = [titleArray objectAtIndex:0];
            break;
        }
        case 2:{
            cancelTitle = [titleArray objectAtIndex:0];
            otherTitle1 = [titleArray objectAtIndex:1];
            break;
        }
        case 3:{
            cancelTitle = [titleArray objectAtIndex:0];
            otherTitle1 = [titleArray objectAtIndex:1];
            otherTitle2 = [titleArray objectAtIndex:2];
            break;
        }
        case 4:{
            cancelTitle = [titleArray objectAtIndex:0];
            otherTitle1 = [titleArray objectAtIndex:1];
            otherTitle2 = [titleArray objectAtIndex:2];
            otherTitle3 = [titleArray objectAtIndex:3];
            break;
        }
    }
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                             delegate:nil
                                                    cancelButtonTitle:cancelTitle
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles: otherTitle1,otherTitle2,otherTitle3,nil];
    
    if (callbackBlock) {
        objc_setAssociatedObject(actionSheet, &ActionSheetCallBackBlockKey, callbackBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    actionSheet.delegate = actionSheet;
    return actionSheet;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    actionSheet.delegate = nil;
    void (^callbackBlock)(UIActionSheet *actionSheet,NSInteger buttonIndex) = objc_getAssociatedObject(actionSheet, &ActionSheetCallBackBlockKey);
    if (callbackBlock){
        callbackBlock(actionSheet,buttonIndex);
    }
}

@end
