//
//  UILabel+labelAttribute.h
//  eMaintain
//
//  Created by  lichong on 16/6/16.
//  Copyright © 2016年 Carsmart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (labelAttribute)

//改变label一个部分字体的颜色
-(void)setLabelAllString:(NSString *)allStr withChangeStr:(NSString *)changeStr;
//改变label一部分字体的颜色和大小
-(void)setLabelAllString:(NSString *)allStr withChangeStr:(NSString *)changeStr withChangeStrFont:(CGFloat)strFont;
//改变label两部分部分字体的颜色
-(void)setLabelAllString:(NSString *)allStr withChangeFirstStr:(NSString *)firstStr  withChangeSecondStr:(NSString *)secondStr;
//改变label两部分部分字体的颜色和大小
-(void)setLabelAllString:(NSString *)allStr withChangeFirstStr:(NSString *)firstStr  withChangeSecondStr:(NSString *)secondStr withChangeStrFont:(CGFloat)strFont;

@end
