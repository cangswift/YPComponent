//
//  ZHProtocol.m
//  TenantWallet
//
//  Created by apple on 2017/5/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "DDProtocol.h"
#import "NSString+Extension.h"
#import "DDRouter.h"

@implementation DDProtocol

//内部
- (instancetype)initWithInnerUrl:(NSString *)url{
    self = [super init];
    if(self){
        [self analysisInnerUrl:url];
    }
    return self;
}

 //外部
-(instancetype)initWithOutUrl:(NSString *)url{
    self = [super init];
    if(self){
        [self analysisOutUrl:url];
    }
    return self;
}

#pragma mark - 解析内部协议
- (void)analysisInnerUrl:(NSString *)urlStr{
    _url = urlStr;
    _target = nil;
    _head = nil;
    _params = nil;
    
    if(_url.length > 7){
        NSString *targetparamStr = [_url substringFromIndex:7];
        NSArray *targetparamArr = [targetparamStr componentsSeparatedByString:@"?"];
        _target = [targetparamArr objectAtIndex:0];
        if(targetparamArr.count > 1){
            //有参数
            NSString *paramStr = [[targetparamArr objectAtIndex:1] URLDecode];
            NSArray *paramArr = [paramStr componentsSeparatedByString:@"&"];
            NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
            for(int i=0;i<paramArr.count;++i){
                NSString *singleParamStr = [paramArr objectAtIndex:i];
                NSArray *singleParamArr = [singleParamStr componentsSeparatedByString:@"="];
                if(singleParamArr.count > 1){
                    NSString *singleParamKey = [singleParamArr objectAtIndex:0];
                    NSString *singleParamValue = [singleParamArr objectAtIndex:1];
                    [params setValue:singleParamValue forKey:singleParamKey];
                }
            }
            _params = params;
        }
    }
}


#pragma mark - 解析外部协议
- (void)analysisOutUrl:(NSString *)urlStr{
    _url = nil;
    _target = nil;
    _head = nil;
    _params = nil;
    _head = [DDRouter router].protocolHead;
    
    if(urlStr.length > 7){
        NSString *targetparamStr = [[urlStr substringFromIndex:7] tripleDES:kCCDecrypt key:[DDRouter router].protocolEncodeKey];
        if(targetparamStr){
            _url = [_head stringByAppendingString:targetparamStr];
            NSArray *targetparamArr = [targetparamStr componentsSeparatedByString:@"?"];
            _target = [targetparamArr objectAtIndex:0];
            if(targetparamArr.count > 1){
                NSString *paramStr = [[targetparamArr objectAtIndex:1] URLDecode];
                NSArray *paramArr = [paramStr componentsSeparatedByString:@"&"];
                NSMutableDictionary *params = [NSMutableDictionary new];
                for(int i=0;i<paramArr.count;++i){
                    NSString *singleParamStr = [paramArr objectAtIndex:i];
                    NSArray *singleParamArr = [singleParamStr componentsSeparatedByString:@"="];
                    if(singleParamArr.count > 1){
                        NSString *singleParamKey = [singleParamArr objectAtIndex:0];
                        NSString *singleParamValue = [[singleParamArr objectAtIndex:1] URLDecode];
                        [params setValue:singleParamValue forKey:singleParamKey];
                    }
                }
                _params = params;
            }
        }else{
            NSLog(@"协议解析出错：协议加密异常");
        }
    }
}


@end
