//
//  DDBaseNavBarView.m
//  dinglc
//
//  Created by 杨仲杰 on 2017/11/11.
//  Copyright © 2017年 dingzhu. All rights reserved.
//

#import "DDBaseNavBarView.h"

@interface DDBaseNavBarView ()

@end

@implementation DDBaseNavBarView

- (instancetype)initWithFrame:(CGRect)frame WithTitle:(NSString *)title{
    
    self = [self initWithFrame:frame];
    if (self) {
        
        UILabel *titleLab = [[UILabel alloc] init];
        
        [self addSubview:titleLab];
        titleLab.text =title;
        titleLab.textColor = HexRGB(0x263238);
        titleLab.font = [UIFont systemFontOfSize:18];
        titleLab.textAlignment = NSTextAlignmentCenter;
        __weak __typeof__(self) weakSelf = self;
        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf).mas_offset(STATUSBAR_HEIGHT);
            make.height.mas_equalTo(44);
            make.width.mas_equalTo(100);
            make.centerX.mas_equalTo(weakSelf);
            
        }];
        
    }
    return self;
    
}

@end
