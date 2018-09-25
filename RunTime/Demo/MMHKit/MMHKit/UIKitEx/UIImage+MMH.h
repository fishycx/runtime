//
//  UIImage+MMH.h
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MMH)

/**
 * @abstract 根据UIColor实例化一张图片
 */
+ (nullable UIImage *)imageWithColor:(UIColor *)color;

/**
 * @abstract 根据UIColor实例化一张指定size的图片
 */
+ (nullable UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 * @abstract 使用贝塞尔曲线UIBezierPath，给UIImage画出圆角
 */
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius;

/**
 * @abstract 使用贝塞尔曲线UIBezierPath，给UIImage画出圆角，且可以设置border
 */
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(nullable UIColor *)borderColor;

/**
 *  使用贝塞尔曲线UIBezierPath，给图片设置圆角
 *
 *  @param radius           圆角度数
 *  @param corners          设置边角, UIRectCornerTopLeft, UIRectCornerTopRight, UIRectCornerBottomLeft, UIRectCornerBottomRight, UIRectCornerAllCorners
 *  @param borderWidth      边框粗细
 *  @param borderColor      边框颜色
 *  @param borderLineJoin   线帽
 *
 *  @return 处理后的图片
 */
- (nullable UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                                       corners:(UIRectCorner)corners
                                   borderWidth:(CGFloat)borderWidth
                                   borderColor:(UIColor *)borderColor
                                borderLineJoin:(CGLineJoin)borderLineJoin;

/**
 * @abstract 图片旋转方法
 */
- (nullable UIImage *)imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;

/**
 * @abstract 图片向左旋转90度
 */
- (nullable UIImage *)imageByRotateLeft90;

/**
 * @abstract 图片向右旋转90度
 */
- (nullable UIImage *)imageByRotateRight90;

/**
 * @abstract 图片旋转180度
 */
- (nullable UIImage *)imageByRotate180;

/**
 * @abstract 图片垂直翻转
 */
- (nullable UIImage *)imageByFlipVertical;

/**
 * @abstract 图片水平翻转
 */
- (nullable UIImage *)imageByFlipHorizontal;

/**
 *
 */
- (nullable UIImage *)centerSquareImage;

/**
 * @abstract 将图片按照一定比例调整大小
 */
+ (UIImage *)resizedImageToFitUploadSizeOfImage:(UIImage *)originalImage;
+ (UIImage *)resizedImageToFitUploadSizeOfImage:(UIImage *)originalImage scale:(CGFloat)scale;
+ (NSData *)resizedImageDataToFitUploadSizeOfImage:(UIImage *)originalImage;
+ (NSData *)resizedImageDataToFitUploadSizeOfImage:(UIImage *)originalImage maxSize:(NSInteger)maxSize;
+ (NSData *)resetSizeOfImageData:(UIImage *)originalImage maxSize:(NSInteger)maxSize;

/**
 * @abstract图片尺寸适配
 */
+ (UIImage*)resizedImageWithSize:(CGSize)newSize image:(UIImage*)image;


/**
 * @abstract 截屏
 */
+ (UIImage *)screenShot;

/**
 * @abstract 由view生成图片
 */
+ (UIImage *)createImageWithView:(UIView *)view;


/**
 * 图片特效处理
 * param applyBlurWithRadius 应用模糊半径
 * param tintColor 透明度
 * param saturationDeltaFactor 三原色
 */
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage * _Nullable )maskImage;

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffectforAres;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

@end

NS_ASSUME_NONNULL_END
