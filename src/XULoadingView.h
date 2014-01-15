//
//  XULoadingView.h
//
//  Created by xu lingyi on 14-1-15.
//  Copyright (c) 2014年 gamefy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XULoadingView : UIView

@property (nonatomic, strong) UIView *parentView;               //需要遮住的父View
@property (assign) float marginTop;                             //遮罩背景层离顶部
@property (assign) float marginBottom;                          //遮罩背景层离底部

@property (nonatomic, strong) UIView *backImageView;            //背景遮罩层
@property (nonatomic, strong) UIImageView *loadingImageView;    //Loading图片
@property (nonatomic, strong) UILabel *loadingTextLabel;        //Loading文字

//初始化
- (id)initWithParentView:(UIView *)parentView;
//显示
- (void)show;
//移除
- (void)dismiss;

@end
