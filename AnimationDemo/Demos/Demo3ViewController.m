//
//  Demo3ViewController.m
//  AnimationDemo
//
//  Created by 孙继桐 on 2018/5/6.
//  Copyright © 2018年 Sun. All rights reserved.
//

#import "Demo3ViewController.h"

@interface Demo3ViewController ()

@property (nonatomic,strong) UIView *backView;

@end

@implementation Demo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self animation];
}

- (void)animation {
    _backView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:_backView];

    [self createAnimationWithLayerFrame:_backView.bounds
                      andBezierPathRect:CGRectMake(0, 0, 100, 100)
                  andTransformFromValue:CATransform3DScale(CATransform3DIdentity, 0, 0, 0)
                    andTransformToValue:CATransform3DScale(CATransform3DIdentity, 1, 1, 0)
                   andPositionFromValue:CGPointMake(0, 0)
                     andPositionToValue:CGPointMake(0, 0)];
    
    [self createAnimationWithLayerFrame:CGRectMake(0, 0, 50, 50)
                      andBezierPathRect:CGRectMake(0, 0, 50, 50)
                  andTransformFromValue:CATransform3DScale(CATransform3DIdentity, 1, 1, 0)
                    andTransformToValue:CATransform3DScale(CATransform3DIdentity, 0, 0, 0)
                   andPositionFromValue:CGPointMake(25, 25)
                     andPositionToValue:CGPointMake(0, 0)];
    
    [self createAnimationWithLayerFrame:CGRectMake(50, 0, 50, 50)
                      andBezierPathRect:CGRectMake(0, 0, 50, 50)
                  andTransformFromValue:CATransform3DScale(CATransform3DIdentity, 1, 1, 0)
                    andTransformToValue:CATransform3DScale(CATransform3DIdentity, 0, 0, 0)
                   andPositionFromValue:CGPointMake(75, 25)
                     andPositionToValue:CGPointMake(100, 0)];
    
    [self createAnimationWithLayerFrame:CGRectMake(0, 50, 50, 50)
                      andBezierPathRect:CGRectMake(0, 0, 50, 50)
                  andTransformFromValue:CATransform3DScale(CATransform3DIdentity, 1, 1, 0)
                    andTransformToValue:CATransform3DScale(CATransform3DIdentity, 0, 0, 0)
                   andPositionFromValue:CGPointMake(25, 75)
                     andPositionToValue:CGPointMake(0, 100)];
    
    [self createAnimationWithLayerFrame:CGRectMake(50, 50, 50, 50)
                      andBezierPathRect:CGRectMake(0, 0, 50, 50)
                  andTransformFromValue:CATransform3DScale(CATransform3DIdentity, 1, 1, 0)
                    andTransformToValue:CATransform3DScale(CATransform3DIdentity, 0, 0, 0)
                   andPositionFromValue:CGPointMake(75, 75)
                     andPositionToValue:CGPointMake(100, 100)];
}

- (void)createAnimationWithLayerFrame:(CGRect)rect andBezierPathRect:(CGRect)bezierRect andTransformFromValue:(CATransform3D)fromTransform andTransformToValue:(CATransform3D)toTransform andPositionFromValue:(CGPoint)fromPoint andPositionToValue:(CGPoint)toPoint {
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = rect;
    layer.path = [UIBezierPath bezierPathWithRect:bezierRect].CGPath;
    layer.fillColor = [UIColor redColor].CGColor;
    [_backView.layer addSublayer:layer];
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.duration = 4;
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:fromTransform];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:toTransform];
    transformAnimation.repeatCount = HUGE;
    [layer addAnimation:transformAnimation forKey:nil];
    
    if ((fromPoint.x == 0 && fromPoint.y == 0)) {
        return;
    }
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.duration = 4;
    positionAnimation.fromValue = [NSValue valueWithCGPoint:fromPoint];
    positionAnimation.toValue = [NSValue valueWithCGPoint:toPoint];
    positionAnimation.repeatCount = HUGE;
    [layer addAnimation:positionAnimation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
