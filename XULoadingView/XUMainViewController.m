//
//  XUMainViewController.m
//  XULoadingView
//
//  Created by xu01 on 14-1-15.
//  Copyright (c) 2014年 xu01. All rights reserved.
//

#import "XUMainViewController.h"
#import "XULoadingView.h"

@interface XUMainViewController ()
{
    XULoadingView *loadingView;
}
@end

@implementation XUMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    showBtn.layer.cornerRadius = 5.0;
    showBtn.layer.borderWidth = 1.0;
    showBtn.layer.borderColor = [[UIColor grayColor] CGColor];
    showBtn.frame = CGRectMake(0, 0, 80, 30);
    showBtn.backgroundColor = [UIColor whiteColor];
    [showBtn setTitle:@"Show" forState:UIControlStateNormal];
    showBtn.center = self.view.center;
    [showBtn addTarget:self action:@selector(showLoading:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
}

- (void)showLoading:(UIButton *)button
{
    loadingView = [[XULoadingView alloc] initWithParentView:self.view];
    loadingView.loadingTextLabel.text = @"加载中";
    [loadingView show];
    [self performSelector:@selector(hideLoading) withObject:nil afterDelay:5.0f];
}

- (void)hideLoading
{
    [loadingView dismiss];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
