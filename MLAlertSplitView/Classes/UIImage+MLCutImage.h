//
//  UIImage+MLCutImage.h
//  MLSplitAlert
//
//  Created by Marius Landwehr on 02.12.12.
//  Copyright (c) 2012 Marius Landwehr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MLCutImage)

- (UIImage *)cutFromRect:(CGRect)rect;

@end