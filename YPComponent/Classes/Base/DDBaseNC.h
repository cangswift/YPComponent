//
//  DDBaseNC.h
//
//  Created by Apple on 2017/4/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

/**导航栏基类*/
@interface DDBaseNC : UINavigationController

/**透明度*/
@property (nonatomic , assign) CGFloat alpha;
/**背景色*/
@property (nonatomic , strong) UIColor *backgroundColor;
/**标题属性*/
@property (nonatomic , strong) NSDictionary *titleTextAttributes;
/**用于标识唯一性*/
@property (nonatomic , strong) NSString *identifier;

@end
