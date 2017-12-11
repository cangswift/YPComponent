//
//  ZHScrollView.m
//  AFNetworking
//  dinglc
//
//  Created by yaop on 2017/11/6.
//  Copyright © 2017年 dingzhu. All rights reserved.
//
#import "DDScrollView.h"

@implementation DDScrollView

- (instancetype) initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        [self tap];
#ifdef __IPHONE_11_0
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
#endif
    }
    return self;
}

-(void)tap{
    UITapGestureRecognizer *viewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    viewTap.delegate = self;
    viewTap.cancelsTouchesInView = NO;
    [self addGestureRecognizer:viewTap];
    
}
-(void)tapClick{
    [self endEditing:YES];
}



@end
