//
//  KSCommonAirView.m
//  AirVewDemo
//
//  Created by zhm on 16/5/9.
//  Copyright © 2016年 zhm. All rights reserved.
//

#import "KSCommonAirView.h"
#define SCREEN_BOUND [UIScreen mainScreen].bounds

@interface KSCommonAirView ()

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation KSCommonAirView


- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75];
        self.layer.shadowRadius = 6.0;
        self.layer.shadowColor = [UIColor redColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(3.0, 3.0);
        self.layer.shadowOpacity = 0.8;
        
    }
    
    return self;
}



- (id)initWithKeywords:(NSString *)keywords withDurationTime:(CGFloat)duration{

    if (duration <= 0) {
        
        duration = 2.0;
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(automaticDismiss) userInfo:nil repeats:NO];

    CGRect frame = CGRectMake(60, 90, CGRectGetWidth(SCREEN_BOUND) - 60 * 2, 90);
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75];
        self.layer.shadowRadius = 6.0;
        self.layer.shadowColor = [UIColor redColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(3.0, 3.0);
        self.layer.shadowOpacity = 0.8;
        self.alpha = 0;
        self.layer.cornerRadius = 5;
        
    }

    return self;

}


- (void)showOnParentView:(UIView *)parentView{

    [parentView addSubview:self];
    
    [UIView animateWithDuration:0.5 animations:^{
       
        self.alpha = 1;
        
        
    }];


}


- (void)automaticDismiss{
    
    [self.timer invalidate];
    [UIView animateWithDuration:0.5 animations:^{
        
        self.alpha = 0.0;
        
    }completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}

- (void)dealloc{

    [self.timer invalidate];


}



@end
