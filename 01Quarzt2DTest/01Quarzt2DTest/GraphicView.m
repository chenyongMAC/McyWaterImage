//
//  GraphicView.m
//  01Quarzt2DTest
//
//  Created by 陈勇 on 15/9/9.
//  Copyright (c) 2015年 陈勇. All rights reserved.
//

#import "GraphicView.h"

@implementation GraphicView

-(void) drawRect:(CGRect)rect {
    //直接获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawImage:context];
}

#pragma mark -绘制线条基本方式
-(void) drawLine:(CGContextRef)context {
    
//    1.获取图形上下文
    
//    2.创建图形路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50, 50);
    CGPathAddLineToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL, 50, 100);
    
    CGPathCloseSubpath(path);
//    3.将路径添加到图形上下文
    CGContextAddPath(context, path);
//    4.设置图形属性
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1);
    CGContextSetRGBFillColor(context, 1, 0, 0, 1);
    CGContextSetLineWidth(context, 3);
//    5.绘制
    CGContextDrawPath(context, kCGPathFillStroke);
//    6.释放路径
    CGPathRelease(path);
}

#pragma mark - 绘制线条通用方式
-(void) drawLine2:(CGContextRef) context {
    CGPoint points[] = {{50,50}, {200, 200}, {50, 200}, {50, 50}};
    CGContextAddLines(context, points, 4);
    
    [[UIColor redColor] setStroke];
    [[UIColor greenColor] setFill];
    CGContextSetLineWidth(context, 3);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
}

#pragma mark - 绘制圆
-(void) drawCircle:(CGContextRef) context {
    CGContextAddArc(context, 100, 100, 50, 0, 2*M_PI, 0);
    
    [[UIColor redColor] set];
    
    CGContextDrawPath(context, kCGPathFillStroke);

}

#pragma mark - 绘制矩形
-(void) drawRec:(CGContextRef) context {
    CGContextAddRect(context, CGRectMake(50, 50, 100, 100));
    
    [[UIColor redColor] set];
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark - 绘制贝塞尔曲线
-(void) drawBezier:(CGContextRef) context {
    CGContextMoveToPoint(context, 20, 200);
    
    CGContextAddCurveToPoint(context, 100, 220, 200, 300, 300, 50);
    
    [[UIColor redColor] set];
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark - 绘制图形(轻量级)
-(void) drawImage:(CGContextRef) context {
//    1.创建UIImage
    UIImage *image = [UIImage imageNamed:@"ali.jpg"];
//    2.坐标转化
//        (1)保存UIKitContext
    CGContextSaveGState(context);
//        (2)转换左边系
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -image.size.height);
//        (3)绘制
    CGContextDrawImage(context, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage);
//        (4)恢复context
    CGContextRestoreGState(context);
}


@end







