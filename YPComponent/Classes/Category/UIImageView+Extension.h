//
//  UIImageView+Extension.h
//
//  Created by Apple on 16/6/7.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Extension)

/**设置网络图片*/
- (void)loadImage:(NSString *_Nullable)url;
- (void)loadImage:(NSString *_Nullable)url placeholder:(UIImage *_Nullable)placeholder;

@end
