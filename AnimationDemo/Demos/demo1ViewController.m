//
//  demo1ViewController.m
//  AnimationDemo
//
//  Created by 孙继桐 on 2018/5/6.
//  Copyright © 2018年 Sun. All rights reserved.
//

#import "demo1ViewController.h"


@interface demo1ViewController ()

@property (nonatomic,strong) UIBezierPath *path;

@end

@implementation demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self animation];
}

- (void)animation {
    CGPoint point1 = CGPointMake(10, 100);
    CGPoint point2 = CGPointMake(10, 300);
    CGPoint point3 = CGPointMake(200, 300);
    CGPoint point4 = CGPointMake(200, 100);
    _path = [UIBezierPath bezierPath];
    [_path moveToPoint:point1];
    [_path addLineToPoint:point2];
    [_path addLineToPoint:point3];
    [_path addLineToPoint:point4];
    [_path addQuadCurveToPoint:point1 controlPoint:CGPointMake(100, 50)];
    
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    shapelayer.path = _path.CGPath;
    shapelayer.strokeColor = [UIColor redColor].CGColor;
    shapelayer.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:shapelayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 3;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [shapelayer addAnimation:animation forKey:nil];
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
