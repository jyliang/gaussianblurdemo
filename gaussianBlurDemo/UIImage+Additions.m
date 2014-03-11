//
//  UIImage+Additions.m
//  gaussianBlurDemo
//
//  Created by Jason Liang on 3/11/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import "UIImage+Additions.h"
#import "UIImage+ImageEffects.h"

@implementation UIImage (Additions)

+ (UIImage *)gaussianBlurImage:(UIImage *)image radius:(CGFloat)radius quality:(CGFloat)quality sizeUpTo:(CGSize)size {
    UIImage *blurredImage;
    CGSize newSize = CGSizeMake(size.width * quality, size.height * quality);
    UIImage *sizedDownImage = [UIImage resizeImage:image size:CGSizeMake(9, 9) withInterpolationQuality:kCGInterpolationNone];
    sizedDownImage = [UIImage resizeImage:sizedDownImage size:size withInterpolationQuality:kCGInterpolationNone];
    blurredImage = [sizedDownImage applyBlurWithRadius:radius tintColor:nil saturationDeltaFactor:1.8 maskImage:nil];;
    return blurredImage;
}

+ (UIImage *)resizeImage:(UIImage *)baseImage size:(CGSize)size withInterpolationQuality:(CGInterpolationQuality)quality {
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, quality);
    [baseImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
