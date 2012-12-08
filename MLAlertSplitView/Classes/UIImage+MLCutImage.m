//
//  UIImage+MLCutImage.m
//  MLSplitAlert
//
//  Created by Marius Landwehr on 02.12.12.
//  Copyright (c) 2012 Marius Landwehr. All rights reserved.
//

#import "UIImage+MLCutImage.h"

@implementation UIImage (MLCutImage)

- (UIImage *)cutFromRect:(CGRect)rect
{
    CGImageRef cutImageRef = self.CGImage;
    CGImageRef partOfImage = CGImageCreateWithImageInRect(cutImageRef, rect);
    CGImageRelease(cutImageRef);
    UIImage *cuttedImage = [UIImage imageWithCGImage:partOfImage];
    CGImageRelease(partOfImage);
    
    return cuttedImage;
}

@end
