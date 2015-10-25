//
//  UIImage+waterImage.m
//  01Quarzt2DTest
//
//  Created by 陈勇 on 15/9/9.
//  Copyright (c) 2015年 陈勇. All rights reserved.
//

#import "UIImage+waterImage.h"

@implementation UIImage (waterImage)

+(instancetype) waterImage:(NSString *)imageName withImage:(NSString *)imageName2 {
    UIImage *image = [UIImage imageNamed:imageName];
    
    //创建一个基于bitmap的上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    
    //绘制图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //绘制水印
    UIImage *waterImage = [UIImage imageNamed:imageName2];
    CGFloat scale = 0.2;
    CGFloat margin = 5;
    CGFloat labelWidth = image.size.width * scale;
    CGFloat labelHeight = image.size.height * scale;
    CGFloat labelX = image.size.width - margin - labelWidth;
    CGFloat labelY = image.size.height - margin - labelHeight;
    [waterImage drawInRect:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
    
    
    //从上下文中获取制作完成的UIImage
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

+(instancetype) waterImage:(NSString *)imageName withText:(NSString *)text {
    //获取图形上下文
    UIImage *image = [UIImage imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    //1.绘制图片
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //编辑水印文本
    UIFont *font = [UIFont systemFontOfSize:20];
    UIColor *color = [UIColor whiteColor];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{
                                 NSFontAttributeName : font,
                                 NSForegroundColorAttributeName : color,
                                 NSParagraphStyleAttributeName : style
                                 };
    //2.绘制文本
    [text drawInRect:CGRectMake(0, image.size.height-25, image.size.width, 25) withAttributes:attributes];
    //获取绘制图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束绘制
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end

















