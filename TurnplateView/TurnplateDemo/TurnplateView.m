//
//  TurnplateView.m
//  TurnplateDemo
//
//  Created by carsmart on 16/5/11.
//  Copyright © 2016年 carsmart. All rights reserved.
//

#import "TurnplateView.h"
#import "UIView+convenience.h"
#import "WheelButton.h"
#define kScreenWith [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define angle2Radian(a)  ((a) / 180.0 * M_PI)

typedef enum : NSUInteger {
    none,
    increasing, //递增
    diminishing, //递减
} VariableSpeedState;


@interface TurnplateView ()
{
    CGRect viewFrame;
    UILabel *_titleLable;
    
    
    NSInteger roationCount; //旋转总次数
    NSInteger hasRoationCont;  //已旋转的次数
    NSInteger lastIndex;

    UIButton *clickBtn;
    
}
//变速方式
@property (nonatomic,assign) VariableSpeedState variableState;//变速方式
@property (nonatomic,strong) UIImageView *imgView;
@end

@implementation TurnplateView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        viewFrame = frame;
        [self createSubViews];
        [self setUI];
       
    }
    return self;
    
}


-(void)createSubViews
{
    
    _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, viewFrame.size.width, 20)];
    _titleLable.text = @"恭喜你获得了一次抽奖的机会";
    _titleLable.textColor = [UIColor blackColor];
    _titleLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLable];
    
    //图片
    UIImage *img = [UIImage imageNamed:@"LuckyRotateWheel"];
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _titleLable.frameBottom + 10, img.size.width, img.size.height)];
    [_imgView setImage:img];
    _imgView.frameCenterX = self.frameCenterX;
    _imgView.backgroundColor = [UIColor redColor];
    _imgView.userInteractionEnabled = YES;
    [self addSubview:_imgView];
    
    
    UIImage *imgBtn = [UIImage imageNamed:@"LuckyCenterButton"];
    clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clickBtn.frame = CGRectMake(0 , 0, imgBtn.size.width, imgBtn.size.height);
    
    clickBtn.frameCenterX = self.frameCenterX;
    clickBtn.frameCenterY = _imgView.frameCenterY;
    
    [clickBtn setImage:imgBtn forState:UIControlStateNormal];
    [clickBtn setImage:[UIImage imageNamed:@"LuckyCenterButtonPressed"] forState:UIControlStateHighlighted];
    [clickBtn addTarget:self action:@selector(luckyClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:clickBtn];
    
    UIImage *imgArrow = [UIImage imageNamed:@"pointerArrow"];
    UIImageView *imgVwArr = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    imgVwArr.frameCenterX = self.frameCenterX;
    imgVwArr.frameCenterY = _imgView.frameCenterY - 40;
    imgVwArr.image = imgArrow;
    [self addSubview:imgVwArr];
    
 
}





-(void)setUI
{
    
    
    // 加载image大图片
    UIImage *bigImage = [UIImage imageNamed:@"LuckyAstrology"];
    
    // 加载选中的大图片
    UIImage *selBigImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    //获取scale
    CGFloat scale = [UIScreen mainScreen].scale;

    CGFloat imgSizeW = (bigImage.size.width/12) * scale;
    CGFloat imgSizeH = bigImage.size.height *scale;
    for (NSInteger i = 0; i< 12; i++) {
        
        WheelButton *btn = [WheelButton buttonWithType:UIButtonTypeCustom];
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = CGPointMake(_imgView.frameWidth * 0.5, _imgView.frameWidth *0.5);
        btn.bounds = CGRectMake(0, 0, 68, 143);
        
        
        // 旋转的角度
        CGFloat angle1 = i * angle2Radian(30);
        // 旋转按钮
        btn.transform = CGAffineTransformMakeRotation(angle1);
        
        
        CGRect clipRect = CGRectMake(i * imgSizeW, 0, imgSizeW, imgSizeH);
        CGImageRef smallImage = CGImageCreateWithImageInRect(bigImage.CGImage, clipRect);
        [btn setImage:[UIImage imageWithCGImage:smallImage] forState:UIControlStateNormal];
        
        // 设置按钮的选中的image
        // 裁剪选中的selSmallimage
        CGImageRef selSmallImage = CGImageCreateWithImageInRect(selBigImage.CGImage, clipRect);
        [btn setImage:[UIImage imageWithCGImage:selSmallImage] forState:UIControlStateSelected];
        
        [_imgView addSubview:btn];

    }
}


-(void)luckyClickBtn:(UIButton *)sender
{
    [self restViewAnimation];

    sender.enabled = NO;
//    roationCount = arc4random()%10 + 10;
    //改变旋转次数可以得到获奖的信息
    roationCount = 12 * 3 + 4;
    hasRoationCont = 0;
    _duration = 0.2f;
    _variableState = increasing;
    
    [self startAnimatWithView:_imgView];

}


- (void)startAnimatWithView:(UIView *)view
{
    CABasicAnimation *caAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    caAnimation.removedOnCompletion = NO;
    caAnimation.fillMode = kCAFillModeForwards;
    caAnimation.fromValue = @(_angle);
    CGFloat flot = _angle + M_PI/(_awardCount/2);
    caAnimation.toValue = @(flot);
    caAnimation.duration = _duration;
    caAnimation.repeatCount = 1;
    caAnimation.delegate = self;
    //    caAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view.layer addAnimation:caAnimation forKey:@"anim"];
    _angle = [caAnimation.toValue floatValue];
    NSLog(@"%f",_angle);
}

-(void)animationDidStart:(CAAnimation *)anim
{
    hasRoationCont += 1;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (hasRoationCont >= roationCount) {
        
        clickBtn.enabled = YES;
        return;
    }
    if (hasRoationCont>=self.speed&&hasRoationCont<=roationCount-self.speed) {
        [self startAnimatWithView:_imgView];
        return;
    }
    if (hasRoationCont<self.speed) {
        self.variableState = increasing;
    }else if (hasRoationCont>roationCount-self.speed){
        self.variableState = diminishing;
    }
    if (self.variableState==increasing) {
        _duration-=0.01;
    }else{
        _duration+=0.01;
    }
    
    
    if (_duration<0.01) {
        _duration=0.01;
    }

    [self startAnimatWithView:_imgView];
}

-(void)restViewAnimation
{
    _awardCount = 12;
    _duration = 0.2f;
    _angle = 0;
    _speed = 18;
    [_imgView.layer removeAllAnimations];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
