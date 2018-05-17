//
//  Demo5ViewController.m
//  AnimationDemo
//
//  Created by 孙继桐 on 2018/5/16.
//  Copyright © 2018年 Sun. All rights reserved.
//

#import "Demo5ViewController.h"

@interface Demo5ViewController ()

@end

@implementation Demo5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self animation];
}
- (void)animation{
    CAReplicatorLayer *musicLayer = [CAReplicatorLayer layer];
    musicLayer.frame = CGRectMake(0, 0, 60, 100);
    musicLayer.position = self.view.center;
    musicLayer.instanceTransform = CATransform3DMakeTranslation(15, 0, 0);
    musicLayer.instanceCount = 3;
    musicLayer.masksToBounds = YES;
    musicLayer.instanceDelay = 0.2;
    [self.view.layer addSublayer:musicLayer];
    
    CALayer *tLayer = [CALayer layer];
    tLayer.frame = CGRectMake(10, 100, 10, 30);
    tLayer.backgroundColor = [UIColor redColor].CGColor;
    [musicLayer addSublayer:tLayer];
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position.y"];
    anim.duration = 0.35;
    anim.fromValue = @100;
    anim.toValue = @85;
    anim.autoreverses = YES;
    anim.repeatCount = HUGE;
    [tLayer addAnimation:anim forKey:nil];
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
