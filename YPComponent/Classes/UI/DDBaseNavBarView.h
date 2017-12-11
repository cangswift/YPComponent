//
//  DDBaseNavBarView.h
//  dinglc
//
//  Created by 杨仲杰 on 2017/11/11.
//  Copyright © 2017年 dingzhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDBaseNavBarView : UIView


@property(nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) UIButton *rightBtn;

- (instancetype)initWithFrame:(CGRect)frame WithTitle:(NSString *)title;

@end
