//
//  Demo4ViewController.m
//  AnimationDemo
//
//  Created by 孙继桐 on 2018/5/12.
//  Copyright © 2018年 Sun. All rights reserved.
//

#import "Demo4ViewController.h"

@interface Demo4ViewController ()

@end

@implementation Demo4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self animation];
}

- (void)animation {
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2) radius:200 startAngle:0 - M_PI_2 endAngle:M_PI * 2 - M_PI_2 clockwise:YES];
    
    UIView *tView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    tView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2 - 200);
    tView.layer.cornerRadius = 5;
    tView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    
    CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnim.path = path.CGPath;
    keyAnim.repeatCount = HUGE;
    keyAnim.duration = 8;
    [tView.layer addAnimation:keyAnim forKey:nil];
    
    CAReplicatorLayer *replicaLayer = [CAReplicatorLayer layer];
    //replicaLayer.repeatCount = 40;
    replicaLayer.instanceCount = 40;
    replicaLayer.instanceDelay = 0.2;
    replicaLayer.instanceColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor;
    replicaLayer.instanceRedOffset = -0.2;
    replicaLayer.instanceGreenOffset = -0.3;
    replicaLayer.instanceBlueOffset = -0.4;
    [replicaLayer addSublayer:tView.layer];
    [self.view.layer addSublayer:replicaLayer];
    
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
