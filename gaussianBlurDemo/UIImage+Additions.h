//
//  UIImage+Additions.h
//  gaussianBlurDemo
//
//  Created by Jason Liang on 3/11/14.
//  Copyright (c) 2014 Jason Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additions)

+ (UIImage *)gaussianBlurImage:(UIImage *)image radius:(CGFloat)radius quality:(CGFloat)quality sizeUpTo:(CGSize)size;

@end
