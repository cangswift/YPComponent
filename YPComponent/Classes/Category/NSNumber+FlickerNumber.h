//
//  NSNumber+FlickerNumber.h
//  StoneMoney
//
///  Created by 王磊 on 17/3/4.
//  Copyright (c) 2017年 杭州鼎柱网络科技有限公司@王磊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (FlickerNumber)

//两位小数
- (NSString *)formatNumberDecimal;
//四位小数
- (NSString *)formatNumberDecimalWithFour;
// 千分号 显示
- (NSString *)formatNumberNo;
// 千分号 显示 四位
- (NSString *)formatNumberNoTow;

//四舍五入保留4位
- (NSString *)formatNumbeWithFour;
//四舍五入保留2位
- (NSString *)formatNumberWithTow;

@end
