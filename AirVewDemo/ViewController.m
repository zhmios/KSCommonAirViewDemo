//
//  ViewController.m
//  AirVewDemo
//
//  Created by zhm on 16/5/9.
//  Copyright © 2016年 zhm. All rights reserved.
//

#import "ViewController.h"
#import "KSCommonAirView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)btnPress:(id)sender {
    
    KSCommonAirView *airView = [[KSCommonAirView alloc]initWithKeywords:@"请先选择需要快捷启动的网址或游戏!" withDurationTime:2.0];
    
    [airView showOnParentView:self.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
