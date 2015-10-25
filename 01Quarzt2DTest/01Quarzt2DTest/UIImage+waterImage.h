//
//  UIImage+waterImage.h
//  01Quarzt2DTest
//
//  Created by 陈勇 on 15/9/9.
//  Copyright (c) 2015年 陈勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (waterImage)

+(instancetype) waterImage:(NSString *)imageName withImage:(NSString *)imageName2;

+(instancetype) waterImage:(NSString *)imageName withText:(NSString *)text;

@end
