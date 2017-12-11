//
//  ZHRouter.h
//  apple
//
//  Created by apple on 2017/5/10.
//  Copyright © 2017年 apple. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "DDProtocol.h"

/**路由规则代理*/
@protocol ZHRouterRole <NSObject>

@required
/**执行规则*/
- (void)redirect:(DDProtocol *)protocol;
/**目标集合*/
- (NSArray *)targets;

@end

/**路由调度*/
@interface DDRouter : NSObject


/**获取单例*/
+ (instancetype)router;

/**协议头*/
@property (nonatomic , copy) NSString *protocolHead;

/**协议加解密Key*/
@property (nonatomic , copy) NSString *protocolEncodeKey;


/**检测协议合法性*/
+ (BOOL) checkUrl:(NSString *)url;

/**添加路由规则*/
- (void) addRule:(id<ZHRouterRole>)rule;

//外部协议操作方法
- (DDProtocol *)go:(NSString *)url;
- (DDProtocol *)go:(NSString *)url withCallBack:(id)callBack;
- (DDProtocol *)go:(NSString *)url withCallBack:(id)callBack isPush:(BOOL)isPush;

//内部协议操作方法
- (DDProtocol *)goWithoutHead:(NSString *)url;
- (DDProtocol *)goWithoutHead:(NSString *)url withCallBack:(id)callBack;
- (DDProtocol *)goWithoutHead:(NSString *)url withCallBack:(id)callBack isPush:(BOOL)isPush;

//内部控制器操作方法
- (DDProtocol *)goVC:(NSString *)url;
- (DDProtocol *)goVC:(NSString *)url withCallBack:(id)callBack;
- (DDProtocol *)goVC:(NSString *)url withCallBack:(id)callBack isPush:(BOOL)isPush;

//协议对象操作方法
- (void)goProtocol:(DDProtocol *)protocol;
- (void)goProtocol:(DDProtocol *)protocol withCallBack:(id)callBack;
- (void)goProtocol:(DDProtocol *)protocol withCallBack:(id)callBack isPush:(BOOL)isPush;

@end
