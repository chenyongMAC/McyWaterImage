//
//  MyLabel.m
//  01Quarzt2DTest
//
//  Created by 陈勇 on 15/9/9.
//  Copyright (c) 2015年 陈勇. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

-(void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawLabel:context];
}

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.font=[UIFont systemFontOfSize:10];
        self.text=nil;
    }
    return self;
}

-(void) setText:(NSString *)text {
    _text = text;
}

-(void) setFont:(UIFont *)font {
    _font = font;
}

-(void) drawLabel:(CGContextRef) context {
    UIFont *font = _font;
    NSString *string = _text;
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    UIColor *color = [UIColor whiteColor];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : font,
                                 NSParagraphStyleAttributeName : style,
                                 NSForegroundColorAttributeName : color
                                 };
    [string drawInRect:self.bounds withAttributes:attributes];
    
    
}

@end











