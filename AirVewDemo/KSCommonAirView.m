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
@property (nonatomic,strong) UILabel *contentLabel;

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
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(automaticDismiss) userInfo:nil repeats:NO];
        self.contentLabel = [[UILabel alloc]init];
        [self addSubview:self.contentLabel];
        [self.contentLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        NSDictionary *views = @{@"contentLabel":self.contentLabel};
        
        NSArray *hConstraintsLabel = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[contentLabel]-10-|" options:NSLayoutFormatAlignAllLeading metrics:nil views:views];
        
        NSArray *vConstraintsLabel = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[contentLabel]-10-|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views];
        [self addConstraints:hConstraintsLabel];
        [self addConstraints:vConstraintsLabel];
        
        self.contentLabel.backgroundColor = [UIColor purpleColor];
        
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
