//
//  XULoadingView.m
//
//  Created by xu lingyi on 14-1-15.
//  Copyright (c) 2014年 gamefy. All rights reserved.
//

#import "XULoadingView.h"

#define kFYLoadingViewWidth        55.0f            //Loading界面背景宽度
#define kFYLoadingViewHeight       55.0f            //Loading界面背景高度
#define kFYLoadingImageViewWidth   27.0f            //Loading图片宽度
#define kFYLoadingImageViewHeight  27.0f            //Loading图片高度
#define kFYLoadingTextLabelWidth   35.0f            //Loading文字宽度
#define kFYLoadingTextLabelHeight  16.0f            //Loading文字高度

@implementation XULoadingView

- (id)initWithParentView:(UIView *)parentView
{
    if (self = [super init]) {
        self.parentView = parentView;
        //self.marginTop = marginTop;
        //self.marginBottom = marginBottom;
        
        CGRect bounds = self.parentView.bounds;
        bounds.origin.y = 0;
        self.backImageView = [[UIView alloc] initWithFrame:bounds];
        self.backImageView.backgroundColor = [UIColor blackColor];
        self.backImageView.alpha = 0.2;
        
        self.layer.cornerRadius = 5.0;
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
        
        self.loadingImageView = [[UIImageView alloc] initWithImage:[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"loading" ofType:@"png"]]];
        self.loadingImageView.frame = CGRectMake((kFYLoadingViewWidth-kFYLoadingImageViewWidth)*0.5,
                                                 (kFYLoadingViewHeight-kFYLoadingImageViewHeight-kFYLoadingTextLabelHeight)*0.5,
                                                 kFYLoadingImageViewWidth,
                                                 kFYLoadingImageViewHeight);
        
        [self addSubview:self.loadingImageView];
        
        self.loadingTextLabel = [[UILabel alloc] initWithFrame:CGRectMake((kFYLoadingViewWidth-kFYLoadingTextLabelWidth)*0.5,
                                                                          ((kFYLoadingViewHeight-kFYLoadingImageViewHeight-kFYLoadingTextLabelHeight)*0.5+kFYLoadingImageViewHeight),
                                                                          kFYLoadingTextLabelWidth,
                                                                          kFYLoadingTextLabelHeight)];
        self.loadingTextLabel.textAlignment = NSTextAlignmentCenter;
        self.loadingTextLabel.text = @"加载中";
        self.loadingTextLabel.font = [UIFont fontWithName:@"Helvetica" size:10.0];
        self.loadingTextLabel.textColor = [UIColor whiteColor];
        self.loadingTextLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.loadingTextLabel];
    }
    return self;
}

- (void)show
{
    self.frame = CGRectMake((CGRectGetWidth(self.parentView.bounds)-kFYLoadingViewWidth)*0.5,
                            CGRectGetHeight(self.parentView.bounds)*0.5-kFYLoadingViewHeight,
                            kFYLoadingViewWidth,
                            kFYLoadingViewHeight);
    [self.parentView addSubview:self];
    [self.loadingImageView.layer addAnimation:[self loopRotationAnimation] forKey:@"looploading"];
}

- (void)dismiss
{
    [self removeFromSuperview];
    [self.backImageView removeFromSuperview];
}


- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview == nil) {
        return;
    }
    [self.parentView addSubview:self.backImageView];
    [super willMoveToSuperview:newSuperview];
}

- (CABasicAnimation *)loopRotationAnimation
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1.0;
    rotationAnimation.repeatCount = HUGE_VALF;
    return rotationAnimation;
}

- (void)dealloc
{
    [self.backImageView release];
    self.backImageView = nil;
    [self.loadingImageView release];
    self.loadingImageView = nil;
    [self.loadingTextLabel release];
    self.loadingTextLabel = nil;
    [super dealloc];
}

@end
