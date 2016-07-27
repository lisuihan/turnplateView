//
//  TurnplateView.h
//  TurnplateDemo
//
//  Created by carsmart on 16/5/11.
//  Copyright © 2016年 carsmart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TurnplateView : UIView


//时间间隔
@property (nonatomic,assign) CFTimeInterval duration;

//奖品个数
@property (nonatomic,assign) NSInteger awardCount;
//旋转速度
@property (nonatomic,assign) NSInteger speed;

//弧度
@property (nonatomic,assign) CGFloat angle;

@end
