//
//  ViewController.m
//  01Quarzt2DTest
//
//  Created by 陈勇 on 15/9/9.
//  Copyright (c) 2015年 陈勇. All rights reserved.
//

#import "ViewController.h"
#import "GraphicView.h"
#import "UIImage+waterImage.h"
#import "MyLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.Quartz2D绘制基本图形
    GraphicView *graphicView = [[GraphicView alloc] initWithFrame:CGRectMake(0, 0, 300, 250)];
    graphicView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:graphicView];
    
    
    //2.水印图片
    UIImageView *waterImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 400, 200, 200)];
    waterImageView.backgroundColor = [UIColor blackColor];
    waterImageView.image = [UIImage waterImage:@"ali.jpg" withText:@"ali.jpg"];
    
    [self.view addSubview:waterImageView];
    
    
    //3.Quartz2D绘制自定义Label
    MyLabel *mylabel = [[MyLabel alloc] initWithFrame:CGRectMake(0, 280, 100, 40)];
    mylabel.backgroundColor = [UIColor blackColor];
    mylabel.text = @"CYYYYYYYYY";
    mylabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:mylabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
