//
//  NSDictionary+DictionaryToJsonString.m
//  StoneMoney
//
//  Created by 陈小东 on 15/7/24.
//  Copyright (c) 2015年 _____stone_chenxiaodong_____. All rights reserved.
//

#import "NSDictionary+DictionaryToJsonString.h"

@implementation NSDictionary (DictionaryToJsonString)

- (NSString *)jsonStringWithDictionary{
    if(!self){
        return @"";
    }
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    NSString *jsonString = @"";
    if(jsonData){
        jsonString = [[NSString alloc] initWithData:jsonData
                                           encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}


@end
