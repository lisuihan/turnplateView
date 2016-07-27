//
//  TwoViewController.m
//  TurnplateDemo
//
//  Created by  lichong on 16/7/27.
//  Copyright © 2016年 carsmart. All rights reserved.
//

#import "TwoViewController.h"
#import "UILabel+labelAttribute.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width, 200)];
    label.numberOfLines = 0;
    label.text = @"准备工作做好了就可以更新了，按住键盘上的Shift+更新(为了避免不必要的麻烦，这里推荐先进入DFU模式再更新)。";
    [label setLabelAllString:label.text withChangeStr:@"更新"];

    [label setLabelAllString:label.text withChangeStr:@"更新" withChangeStrFont:14];

    [label setLabelAllString:label.text withChangeFirstStr:@"做好了" withChangeSecondStr:@"键盘"];
    [label setLabelAllString:label.text withChangeFirstStr:@"做好了" withChangeSecondStr:@"键盘" withChangeStrFont:14];
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
