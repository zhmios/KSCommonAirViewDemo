//
//  KSCommonAirView.h
//  AirVewDemo
//
//  Created by zhm on 16/5/9.
//  Copyright © 2016年 zhm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSCommonAirView : UIView

- (id)initWithKeywords:(NSString *)keywords withDurationTime:(CGFloat)duration;
- (void)showOnParentView:(UIView *)parentView;

@end
