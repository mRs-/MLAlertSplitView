//
//  MLAlertSplitViewDelegate.h
//  MLSplitAlert
//
//  Created by Marius Landwehr on 02.12.12.
//  Copyright (c) 2012 Marius Landwehr. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MLAlertSplitView;

@protocol MLAlertSplitViewDelegate <NSObject>

@optional

// Responding to Actions
- (void)alertSplitView:(MLAlertSplitView *)alertSplitView clickedButtonAtIndex:(NSInteger)buttonIndex;

// Customizing Behavior
- (BOOL)alertSplitViewShouldEneableFirstOtherButton:(MLAlertSplitView *)alertSplitView;
- (void)willPresentAlertSplitView:(MLAlertSplitView *)alertSplitView;
- (void)didPresentAlertSplitView:(MLAlertSplitView *)alertSplitView;
- (void)alertSplitView:(MLAlertSplitView *)alertSplitView willDismissWithButtonIndex:(NSInteger)buttonIndex;
- (void)alertSplitView:(MLAlertSplitView *)alertSplitView didDismissWithButtonIndex:(NSInteger)buttonIndex;

// Canceling
- (void)alertSplitViewCancel:(MLAlertSplitView *)alertSplitView;

@end
