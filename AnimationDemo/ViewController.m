//
//  ViewController.m
//  AnimationDemo
//
//  Created by 孙继桐 on 2018/5/6.
//  Copyright © 2018年 Sun. All rights reserved.
//

#import "ViewController.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *classArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.classArray = [NSMutableArray array];
    [self addViewController:[Demo1ViewController class]];
    [self addViewController:[Demo2ViewController class]];
    [self addViewController:[Demo3ViewController class]];
}

- (void)addViewController:(Class)class {
    [self.classArray addObject:class];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.classArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = NSStringFromClass(self.classArray[indexPath.row]);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = [[self.classArray[indexPath.row] alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = NSStringFromClass(self.classArray[indexPath.row]);
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
