//
//  UIView+MLScreenshot.m
//  MLSplitAlert
//
//  Created by Marius Landwehr on 02.12.12.
//  Copyright (c) 2012 Marius Landwehr. All rights reserved.
//

#import "UIView+MLScreenshot.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (MLScreenshot)

- (UIImage *)screenshot
{
    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return screenshot;
}

@end
