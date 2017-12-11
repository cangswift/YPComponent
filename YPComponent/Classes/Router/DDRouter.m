//
//  ZHRouter.m
//  apple
//
//  Created by apple on 2017/5/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "DDRouter.h"
#import "DDRouterManager.h"

@interface DDRouter ()

@property (nonatomic , strong) NSMutableArray<id<ZHRouterRole>> *rules; //规则集合

@end

@implementation DDRouter


+ (instancetype) router{
    static DDRouter *_instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance = [[DDRouter alloc] init];
    });
    
    return _instance;
}


#pragma mark - 检测url合法性
+ (BOOL)checkUrl:(NSString *)url{
    if(!url){
        NSLog(@"协议“%@”不合法!",url);
        return NO;
    }
    if(![url hasPrefix:[DDRouter router].protocolHead]){
        NSLog(@"协议“%@”不合法!",url);
        return NO;
    }
    NSLog(@"go:“%@”",url);
    return YES;
}

#pragma mark - 添加规则
- (void) addRule:(id<ZHRouterRole>)rule{
    if(!_rules){
        _rules = [NSMutableArray array];
    }
    if(rule){
        [_rules addObject:rule];
    }
}

#pragma mark - 执行外部协议
- (DDProtocol *)go:(NSString *)url{
    return [self go:url withCallBack:nil isPush:YES];
}

- (DDProtocol *)go:(NSString *)url withCallBack:(id)callBack{
    return [self go:url withCallBack:callBack isPush:YES];
}

- (DDProtocol *)go:(NSString *)url withCallBack:(id)callBack isPush:(BOOL)isPush{
    if ([DDRouter checkUrl:url]) {
        DDProtocol *protocol   = [[DDProtocol alloc]initWithOutUrl:url];
        protocol.isPush = isPush;
        protocol.actionType = ZHProtocolActionTypeUrl;
        protocol.callBack = callBack;
        [self redirect:protocol];
        return protocol;
    }
    return nil;
}

#pragma mark - 执行内部部协议
- (DDProtocol *)goWithoutHead:(NSString *)url{
    return [self goWithoutHead:url withCallBack:nil isPush:YES];
}

- (DDProtocol *)goWithoutHead:(NSString *)url withCallBack:(id)callBack{
    return [self goWithoutHead:url withCallBack:callBack isPush:YES];
}

- (DDProtocol *)goWithoutHead:(NSString *)url withCallBack:(id)callBack isPush:(BOOL)isPush{
    url = [NSString stringWithFormat:@"%@%@",_protocolHead,url];
    if([DDRouter checkUrl:url]){
        DDProtocol *protocol = [[DDProtocol alloc]initWithInnerUrl:url];
        protocol.isPush = isPush;
        protocol.actionType = ZHProtocolActionTypeUrl;
        protocol.callBack = callBack;
        [self redirect:protocol];
        return protocol;
    }
    return nil;
}

#pragma mark - 内部控制器操作
- (DDProtocol *)goVC:(NSString *)url{
    return [self goVC:url withCallBack:nil isPush:YES];
}

- (DDProtocol *)goVC:(NSString *)url withCallBack:(id)callBack{
    return [self goVC:url withCallBack:callBack isPush:YES];
}

- (DDProtocol *)goVC:(NSString *)url withCallBack:(id)callBack isPush:(BOOL)isPush{
    url = [NSString stringWithFormat:@"%@%@",_protocolHead,url];
    if([DDRouter checkUrl:url]){
        DDProtocol *protocol = [[DDProtocol alloc]initWithInnerUrl:url];
        protocol.isPush = isPush;
        protocol.actionType = ZHProtocolActionTypeUrl;
        protocol.callBack = callBack;
        [self redirect:protocol];
        return protocol;
    }
    return nil;
}

#pragma mark - 执行协议对象
- (void)goProtocol:(DDProtocol *_Nullable)protocol{
    [self goProtocol:protocol withCallBack:nil isPush:YES];
}

- (void)goProtocol:(DDProtocol *_Nullable)protocol withCallBack:(id _Nullable)callBack{
    [self goProtocol:protocol withCallBack:callBack isPush:YES];
}

- (void)goProtocol:(DDProtocol *)protocol withCallBack:(id)callBack isPush:(BOOL)isPush{
    protocol.isPush = isPush;
    protocol.actionType = ZHProtocolActionTypeUrl;
    protocol.callBack = callBack;
    [self redirect:protocol];
}

#pragma mark - 执行协议以后路由做调整处理
- (void)redirect:(DDProtocol *)protocol{
    __block id<ZHRouterRole> existedRole = nil;
    for(id<ZHRouterRole> role in _rules){
        if([role respondsToSelector:@selector(targets)]){
            NSArray *targets = [role targets];
            [targets enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSString *target = (NSString *)obj;
                if([target isEqualToString:protocol.target]){
                    *stop = true;
                    existedRole = role;
                }
            }];
        }
        if(existedRole && [existedRole respondsToSelector:@selector(redirect:)]){
            [existedRole redirect:protocol];
            return;
        }
    }
    if (protocol.isPush) {
        [[DDRouterManager router] push:protocol.target
                              animated:YES
                             paramsDic:protocol.params
                isHiddenTabbarWhenPush:YES
                            completion:nil];
    }else{
        [[DDRouterManager router] present:protocol.target
                                 animated:YES
                                paramsDic:protocol.params
                               completion:nil];
    }
}

@end
