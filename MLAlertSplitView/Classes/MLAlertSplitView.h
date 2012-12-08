//
//  MLAlertSplitView.h
//  MLSplitAlert
//
//  Created by Marius Landwehr on 02.12.12.
//  Copyright (c) 2012 Marius Landwehr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLAlertSplitViewDelegate.h"

@interface MLAlertSplitView : UIView

@property (weak) id<MLAlertSplitViewDelegate>delegate;

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
           delegate:(id)delegate
  cancelButtonTitle:(NSString *)cancelButtonTitle
   otherButtonTitle:(NSString *)otherButtonTitle;

- (void)show;

@end
