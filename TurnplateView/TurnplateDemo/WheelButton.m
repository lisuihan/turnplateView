//
//  WheelButton.m
//  11-转盘
//
//  Created by teacher on 15-1-23.
//  Copyright (c) 2015年 itcast. All rights reserved.
//  自定义按钮的目的:跳转按钮内部控件的尺寸,UIImageView

#import "WheelButton.h"

@implementation WheelButton

/**
 *  返回按钮内部UIImageView的尺寸
 *
 *  @param contentRect 按钮的bounds
 *
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = (contentRect.size.width - 40) * 0.5;
    return CGRectMake(imageX, 20, 40, 47);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 重写setHighlighted方法目的:取消高亮状态做的事情
- (void)setHighlighted:(BOOL)highlighted
{
//    [super setHighlighted:highlighted];
//    NSLog(@"%s",__func__);
}

@end
