//
//  UITabBar+Extension.h
//  TenantWallet
//
//  Created by Apple on 2017/6/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Extension)

/**显示红点*/
- (void)showBadgeOnItmIndex:(int)index;
/**隐藏红点*/
- (void)hideBadgeOnItemIndex:(int)index;

@end
