//
//  demo2ViewController.m
//  AnimationDemo
//
//  Created by 孙继桐 on 2018/5/6.
//  Copyright © 2018年 Sun. All rights reserved.
//

#import "Demo2ViewController.h"

@interface Demo2ViewController ()

@end

@implementation Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self animation];
}

- (void)animation {
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:backView];
    
    CAShapeLayer *plusLayer = [CAShapeLayer layer];
    plusLayer.frame = backView.layer.bounds;
    plusLayer.path = [UIBezierPath bezierPathWithOvalInRect:backView.bounds ].CGPath;
    plusLayer.fillColor = [UIColor redColor].CGColor;
    plusLayer.opacity = 0;
    //[backView.layer addSublayer:plusLayer];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.instanceCount = 4;
    replicatorLayer.instanceDelay = 1;
    
    [replicatorLayer addSublayer:plusLayer];
    [backView.layer addSublayer:replicatorLayer];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @0.3;
    opacityAnimation.toValue = @0;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0, 0, 0)];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1, 0)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[opacityAnimation,scaleAnimation];
    group.duration = 4;
    group.repeatCount = HUGE;
    group.autoreverses = NO;
    [plusLayer addAnimation:group forKey:nil];
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
