//
//  UIColor+Extension.h
//
//  Created by Apple on 2016/12/22.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**16进制，颜色转换*/
- (NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
+ (UIColor *)colorWithHexRGB:(int)hex;
+ (UIColor *)colorWithHexRGB:(int)hex alpha:(CGFloat)alpha;
@end
