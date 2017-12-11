//
//  UIButton+Extension.h
//
//  Created by Apple on 16/6/7.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

@property (nonatomic , strong) UIFont * _Nullable font;

/**
 *  设置点击事件
 *
 *  @param clickAction 点击事件block
 */
- (void)clickAction:(void(^_Nonnull)(UIButton *_Nonnull button))clickAction;

/**设置网络图片*/
- (void)loadImage:(NSString *_Nullable)url;
- (void)loadImage:(NSString *_Nullable)url placeholder:(UIImage *_Nullable)placeholder;
- (void)loadBackgroundImage:(NSString *_Nullable)url;
- (void)loadBackgroundImage:(NSString *_Nullable)url placeholder:(UIImage *_Nullable)placeholder;


@end
