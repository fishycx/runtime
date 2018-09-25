//
//  MMHMacro.h
//  MMHKit
//
//  Created by DevilSun on 2017/12/22.
//

#ifndef MMHMacro_h
#define MMHMacro_h

#define IS_IOS7_LATER   ([UIDevice currentDevice].systemVersion.floatValue > 6.99)
#define IS_IOS8_LATER   ([UIDevice currentDevice].systemVersion.floatValue > 7.99)
#define IS_IOS9_LATER   ([UIDevice currentDevice].systemVersion.floatValue > 8.99)
#define IS_IOS10_LATER   ([UIDevice currentDevice].systemVersion.floatValue > 9.99)
#define IS_IOS_MORE_THAN(v)   ([UIDevice currentDevice].systemVersion.floatValue > v)
#define IS_IOS_LESS_THAN(v)   ([UIDevice currentDevice].systemVersion.floatValue < v)

#define ios7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define ios8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define ios9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
#define ios10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)
#define ios11 ([[UIDevice currentDevice].systemVersion doubleValue] >= 11.0)
#define ios6 ([[UIDevice currentDevice].systemVersion doubleValue] >= 6.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 7.0)
#define ios5 ([[UIDevice currentDevice].systemVersion doubleValue] < 6.0)
#define iphone5  ([UIScreen mainScreen].bounds.size.height == 568)
#define iphone6  ([UIScreen mainScreen].bounds.size.height == 667)
#define iphone6Plus  ([UIScreen mainScreen].bounds.size.height == 736)
#define iPhoneX CGSizeEqualToSize(CGSizeMake(375, 812), [[UIScreen mainScreen] bounds].size)
#define iphone4  ([UIScreen mainScreen].bounds.size.height == 480)
#define ipadMini2  ([UIScreen mainScreen].bounds.size.height == 1024)

#define kSafeBottomMargin  (iPhoneX ? 34.f : 0.f)
#define kCloseSafeArea(view) ({if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;}})

//安全block
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };

//weak && strong
#define WeakObj(obj)   __weak typeof(obj) obj##Weak = obj;
#define StrongObj(obj) __strong typeof(obj) obj = obj##Weak;

#define kScreenBounds       [[UIScreen mainScreen] bounds]
#define kScreenWidth        ([[UIScreen mainScreen] applicationFrame].size.width)
#define kScreenHeight       ([[UIScreen mainScreen] applicationFrame].size.height)
#define kApplicationFrame   [[UIScreen mainScreen] applicationFrame]
#define kScreenScale        ([UIScreen instancesRespondToSelector:@selector(scale)]?[[UIScreen mainScreen] scale]:(1.0f))

//DLog
#ifdef DEBUG
#define DLog(fmt,...) NSLog((@"%s" "[Line:%d]" fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__);
#else
#define DLog(...)
#endif


#endif /* MMHMacro_h */
