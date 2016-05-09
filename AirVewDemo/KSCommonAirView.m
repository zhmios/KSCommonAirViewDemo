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
@property (nonatomic,assign) CGFloat maxWith;

@end

@implementation KSCommonAirView




- (id)initWithKeywords:(NSString *)keywords withDurationTime:(CGFloat)duration{

    if (duration <= 0) {
        
        duration = 2.0;
    }
    
  CGSize wordSize = [self calculateContentSizeWithContent:keywords];
    
    CGRect frame = CGRectMake(0, 0, wordSize.width + 40.5, wordSize.height + 40.5);
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75];
        self.layer.shadowRadius = 6.0;
        self.layer.shadowColor = [UIColor redColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(3.0, 3.0);
        self.layer.shadowOpacity = 0.8;
        self.alpha = 0;
        self.layer.cornerRadius = 5;
        self.maxWith = 260;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(automaticDismiss) userInfo:nil repeats:NO];
        self.contentLabel = [[UILabel alloc]init];
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.contentLabel];
        [self.contentLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.contentLabel.text = keywords;
        NSDictionary *views = @{@"contentLabel":self.contentLabel};
        
        NSArray *hConstraintsLabel = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[contentLabel]-20-|" options:NSLayoutFormatAlignAllLeading metrics:nil views:views];
        
        NSArray *vConstraintsLabel = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[contentLabel]-20-|" options:NSLayoutFormatAlignAllBaseline metrics:nil views:views];
        [self addConstraints:hConstraintsLabel];
        [self addConstraints:vConstraintsLabel];
        
        
    }
    
    return self;

}


- (CGSize)calculateContentSizeWithContent:(NSString *)contentString{

    
    NSDictionary *attributeDic = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    
    CGRect resultRect = [contentString boundingRectWithSize:CGSizeMake(self.maxWith, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributeDic context:nil];


    return resultRect.size;
}

- (void)showOnParentView:(UIView *)parentView{

    [parentView addSubview:self];
    
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
   
    NSLayoutConstraint *hConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *vConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:parentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:
                                 NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.frame.size.width];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.frame.size.height];
    [self addConstraint:width];
    [self addConstraint:height];
    [parentView addConstraint:hConstraint];
    [parentView addConstraint:vConstraint];
    
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
