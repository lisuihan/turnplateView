//
//  UILabel+labelAttribute.m
//  eMaintain
//
//  Created by  lichong on 16/6/16.
//  Copyright © 2016年 Carsmart. All rights reserved.
//

#import "UILabel+labelAttribute.h"

@implementation UILabel (labelAttribute)

-(void)setLabelAllString:(NSString *)allStr withChangeStr:(NSString *)changeStr
{
    NSMutableAttributedString *attriAllStr = [[NSMutableAttributedString alloc] initWithString:allStr];
    
    NSRange range = [allStr rangeOfString:changeStr];
    
    [attriAllStr addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:range];
    self.attributedText = attriAllStr;
}

-(void)setLabelAllString:(NSString *)allStr withChangeStr:(NSString *)changeStr withChangeStrFont:(CGFloat)strFont
{
    NSMutableAttributedString *attriAllStr = [[NSMutableAttributedString alloc] initWithString:allStr];
    
    NSRange range = [allStr rangeOfString:changeStr];
    
    [attriAllStr addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:strFont]} range:range];
    self.attributedText = attriAllStr;
}

-(void)setLabelAllString:(NSString *)allStr withChangeFirstStr:(NSString *)firstStr withChangeSecondStr:(NSString *)secondStr
{
    NSMutableAttributedString *attriAllStr = [[NSMutableAttributedString alloc] initWithString:allStr];
    
    NSRange firstRange = [allStr rangeOfString:firstStr];
    NSRange secondRange = [allStr rangeOfString:secondStr];
    
    [attriAllStr addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:firstRange];
    [attriAllStr addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:secondRange];
    self.attributedText = attriAllStr;
}

-(void)setLabelAllString:(NSString *)allStr withChangeFirstStr:(NSString *)firstStr withChangeSecondStr:(NSString *)secondStr withChangeStrFont:(CGFloat)strFont
{
    NSMutableAttributedString *attriAllStr = [[NSMutableAttributedString alloc] initWithString:allStr];
    
    NSRange firstRange = [allStr rangeOfString:firstStr];
    NSRange secondRange = [allStr rangeOfString:secondStr];
    
    [attriAllStr addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:strFont]} range:firstRange];
    [attriAllStr addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:strFont]} range:secondRange];
    self.attributedText = attriAllStr;
}

@end
