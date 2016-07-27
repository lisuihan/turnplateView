//
//  ViewController.m
//  TurnplateDemo
//
//  Created by carsmart on 16/5/11.
//  Copyright © 2016年 carsmart. All rights reserved.
//

#import "ViewController.h"
#import "TurnplateView.h"
#import "UILabel+labelAttribute.h"

#define kScreenWith [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, kScreenWith, 200)];
    label.numberOfLines = 0;
    label.text = @"准备工作做好了就可以更新了，按住键盘上的Shift+更新(为了避免不必要的麻烦，这里推荐先进入DFU模式再更新)。";
    [label setLabelAllString:label.text withChangeStr:@"更新"];
    
    [label setLabelAllString:label.text withChangeStr:@"更新" withChangeStrFont:14];
    
    [label setLabelAllString:label.text withChangeFirstStr:@"做好了" withChangeSecondStr:@"键盘"];
    [label setLabelAllString:label.text withChangeFirstStr:@"做好了" withChangeSecondStr:@"键盘" withChangeStrFont:14];
    [self.view addSubview:label];
    
        
//    TurnplateView *turnView = [[TurnplateView alloc] initWithFrame:CGRectMake(0, 64.0, kScreenWith, 300)];
//    turnView.speed = 18;
//    [self.view addSubview:turnView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
