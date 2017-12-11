//
//  NSNumber+FlickerNumber.m
//  StoneMoney
//
//  Created by 王磊 on 17/3/3.
//  Copyright (c) 2017年 杭州鼎柱网络科技有限公司@王磊. All rights reserved.
//

#import "NSNumber+FlickerNumber.h"

@implementation NSNumber (FlickerNumber)

- (NSString *)formatNumberDecimal{
    if(self){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.roundingMode = kCFNumberFormatterRoundFloor;
        [formatter setMaximumFractionDigits:2];
        return [formatter stringFromNumber:self];
    }
    return @"0";
}

- (NSString *)formatNumberDecimalWithFour{
    if(self){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.roundingMode = kCFNumberFormatterRoundFloor;
        formatter.numberStyle = NSNumberFormatterNoStyle;
        [formatter setMaximumFractionDigits:4];
        return [formatter stringFromNumber:self];
    }
    return @"0";
}

- (NSString *)formatNumberNo{
    if(self){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.roundingMode = kCFNumberFormatterRoundFloor;
        [formatter setMaximumFractionDigits:4];
        return [formatter stringFromNumber:self];
    }
    return @"0";
}

- (NSString *)formatNumberNoTow{
    if(self){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.roundingMode = kCFNumberFormatterRoundFloor;
        [formatter setMaximumFractionDigits:2];
        return [formatter stringFromNumber:self];
    }
    return @"0";
}

- (NSString *)formatNumbeWithFour{
    if(self){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.roundingMode = kCFNumberFormatterRoundHalfUp;
        [formatter setMaximumFractionDigits:4];
        [formatter setMinimumFractionDigits:4];
        return [formatter stringFromNumber:self];
    }
    return @"0";
}

- (NSString *)formatNumberWithTow{
    if(self){
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.roundingMode = kCFNumberFormatterRoundHalfUp;
        [formatter setMinimumFractionDigits:2];
        [formatter setMaximumFractionDigits:2];
        return [formatter stringFromNumber:self];
    }
    return @"0.00";
}
//是否是整数
- (BOOL)multipleLongForNumber{
    NSString *str = [NSString stringWithFormat:@"%@",self];
    if([str rangeOfString:@"."].location == NSNotFound){
        return YES;
    }
    return NO;
}

@end
