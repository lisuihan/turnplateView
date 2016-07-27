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
#import "TwoViewController.h"

#define kScreenWith [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
        
    TurnplateView *turnView = [[TurnplateView alloc] initWithFrame:CGRectMake(0, 64.0, kScreenWith, 300)];
    turnView.speed = 18;
    [self.view addSubview:turnView];
    
    
    NSLog(@"%@",turnView);
 
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    TwoViewController  *twoVC = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:twoVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
