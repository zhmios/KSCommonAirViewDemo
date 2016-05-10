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
    

}



- (IBAction)btnPress:(id)sender {
    
    KSCommonAirView *airView = [[KSCommonAirView alloc]initWithKeywords:@"无法打开URL.可能是URL错误，或者应用没有安装，请再次检查。" withDurationTime:1.0];
    
    [airView showOnParentView:self.view];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
