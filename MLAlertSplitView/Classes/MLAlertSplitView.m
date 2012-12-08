//
//  MLAlertSplitView.m
//  MLSplitAlert
//
//  Created by Marius Landwehr on 02.12.12.
//  Copyright (c) 2012 Marius Landwehr. All rights reserved.
//

#import "MLAlertSplitView.h"
#import "UIView+MLScreenshot.h"
#import "UIImage+MLCutImage.h"
#import <QuartzCore/QuartzCore.h>

@interface MLAlertSplitView()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *cancelButtonTitle;
@property (nonatomic, strong) NSString *otherButtonTitle;

@property (nonatomic, strong) UIImageView *topImageView;
@property (nonatomic, strong) UIImageView *bottomImageView;

@end

@implementation MLAlertSplitView


- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
           delegate:(id)delegate
  cancelButtonTitle:(NSString *)cancelButtonTitle
   otherButtonTitle:(NSString *)otherButtonTitle
{
    self = [super init];
    
    if (self) {
        self.title = title;
        self.message = message;
        self.delegate = delegate;
        self.cancelButtonTitle = cancelButtonTitle;
        self.otherButtonTitle = otherButtonTitle;
        [self addLabel];
        [self generateLayout];
    }
    return self;
}

- (void)addLabel
{
    UIView *view = [self mainView];
    
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.text = self.message;
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.textColor = [UIColor colorWithWhite:1 alpha:0.9];
    messageLabel.shadowColor = [UIColor colorWithWhite:.3 alpha:1];
    messageLabel.shadowOffset = CGSizeMake(1, 1);
    
    CGSize constraint = CGSizeMake(view.bounds.size.width - 20, 400);
    CGSize size = [messageLabel.text sizeWithFont:messageLabel.font
                                constrainedToSize:constraint
                                    lineBreakMode:NSLineBreakByWordWrapping];
    CGRect labelRect = CGRectMake(10, 150, view.bounds.size.width - 20, size.height);
    
    messageLabel.frame = labelRect;
    
    CALayer *backgroundLayer = [CALayer layer];
//    CGRect 
    backgroundLayer.frame = messageLabel.bounds;
    backgroundLayer.borderColor = [UIColor colorWithWhite:1 alpha:.25].CGColor;
    backgroundLayer.borderWidth = 1.f;
    backgroundLayer.cornerRadius = 8.f;
    backgroundLayer.backgroundColor = [UIColor colorWithWhite:1 alpha:.1].CGColor;
    
    [messageLabel.layer addSublayer:backgroundLayer];
    
    [self addSubview:messageLabel];
}

- (void)generateLayout
{
    UIView *view = [self mainView];
    self.frame = view.bounds;
    self.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];

    UIImage *screenshot = [view screenshot];
    
    CGRect topFrame = CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height/2);
    CGRect bottomFrame = CGRectMake(0, view.bounds.size.height/2, view.bounds.size.width, view.bounds.size.height/2);
    
    self.topImageView = [[UIImageView alloc] initWithFrame:topFrame];
    self.topImageView.image = [screenshot cutFromRect:topFrame];
    CGRect shadowRect = CGRectMake(self.topImageView.frame.origin.x,
               self.topImageView.frame.size.height,
               self.topImageView.frame.size.width,
               10);
    [self.topImageView.layer addSublayer:[self shadowLayerWithRect:shadowRect FromBottomToTop:NO]];
    
    
    self.bottomImageView = [[UIImageView alloc] initWithFrame:bottomFrame];
    self.bottomImageView.image = [screenshot cutFromRect:bottomFrame];
    CGRect bottomShadowRect = CGRectMake(self.bottomImageView.frame.origin.x,
                                         self.bottomImageView.frame.origin.y - self.bottomImageView.frame.size.height - 10  ,
                                         self.bottomImageView.frame.size.width,
                                         10);
    [self.bottomImageView.layer addSublayer:[self shadowLayerWithRect:bottomShadowRect FromBottomToTop:YES]];
}

- (CAGradientLayer *)shadowLayerWithRect:(CGRect)rect FromBottomToTop:(BOOL)bottomToTop
{
    CAGradientLayer *shadow = [CAGradientLayer layer];
    shadow.frame = rect;

    if(bottomToTop)
    {
        shadow.colors = @[
            (__bridge id)[UIColor clearColor].CGColor,
            (__bridge id)[UIColor colorWithWhite:.2 alpha:0.6].CGColor
        ];
    }
    else
    {
        shadow.colors = @[
            (__bridge id)[UIColor colorWithWhite:.2 alpha:0.6].CGColor,
            (__bridge id)[UIColor clearColor].CGColor
        ];
    }

    return shadow;
}

- (UIView *)mainView
{
    return [[[[[UIApplication sharedApplication] windows] lastObject] subviews] lastObject];
}

- (void)show
{
    if([self.delegate respondsToSelector:@selector(willPresentAlertSplitView:)])
        [self.delegate willPresentAlertSplitView:self];
    
    UIView *view = [self mainView];
    
    [self addSubview:self.topImageView];
    [self addSubview:self.bottomImageView];
    
    [view addSubview:self];
    
    [UIView animateWithDuration:0.75f animations:^{
        self.topImageView.frame = CGRectMake(0, -100, self.topImageView.frame.size.width, self.topImageView.frame.size.height);
        self.bottomImageView.frame = CGRectMake(0, self.bottomImageView.frame.origin.y + 100, self.bottomImageView.frame.size.width, self.bottomImageView.frame.size.height);
    } completion:^(BOOL finished) {
        if(finished)
        {
            if([self.delegate respondsToSelector:@selector(didPresentAlertSplitView:)])
                [self.delegate didPresentAlertSplitView:self];
        }
    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:.75f animations:^{
        self.topImageView.frame = CGRectMake(0, 0, self.topImageView.frame.size.width, self.topImageView.frame.size.height);
        self.bottomImageView.frame = CGRectMake(0, self.bottomImageView.frame.origin.y - 100, self.bottomImageView.frame.size.width, self.bottomImageView.frame.size.height);
    } completion:^(BOOL finished) {
//        if(finished)
//            [self removeFromSuperview];
    }];
}

@end
