

#import <Foundation/Foundation.h>
#import "NSObject+ZHDynamic.h"
#import "UINavigationController+ZHRouter.h"
#import "UIViewController+ZHRouter.h"

/**
 1、需要考虑delegate或者block的情况，最好把需要切换的对象 暴露出去，push、pop等方法，直接返回对象
 
 */
@interface DDRouterManager : NSObject

@property(nonatomic,strong)UINavigationController *navigationController;


+ (instancetype)router;

//push
- (void)push:(NSString *)viewController
    animated:(BOOL)animated;
- (void)push:(NSString *)viewController
    animated:(BOOL)animated
   paramsDic:(NSDictionary *)paramsDic;
- (void)push:(NSString *)viewController
    animated:(BOOL)animated
   paramsDic:(NSDictionary *)paramsDic
isHiddenTabbarWhenPush:(BOOL)isHiddenTabbarWhenPush;
- (void)push:(NSString *)viewController
    animated:(BOOL)animated
   paramsDic:(NSDictionary *)paramsDic
isHiddenTabbarWhenPush:(BOOL)isHiddenTabbarWhenPush
  completion:(void(^)())completion;

/// pop模式
- (void)popViewControllerAnimated:(BOOL)animated;
- (void)popViewControllerAnimated:(BOOL)animated
                        paramsDic:(NSDictionary *)paramsDic;
- (void)popViewControllerAnimated:(BOOL)animated
                        paramsDic:(NSDictionary *)paramsDic
                       completion:(void(^)())completion;

/// pop到指定vc
- (void)popToViewController:(NSString *)viewController
                   animated:(BOOL)animated;
- (void)popToViewController:(NSString *)viewController
                   animated:(BOOL)animated
                  paramsDic:(NSDictionary *)paramsDic;
- (void)popToViewController:(NSString *)viewController
                   animated:(BOOL)animated
                  paramsDic:(NSDictionary *)paramsDic
                 completion:(void(^)())completion;

/// popToRoot模式
- (void)popToRootViewControllerAnimated:(BOOL)animated;
- (void)popToRootViewControllerAnimated:(BOOL)animated
                              paramsDic:(NSDictionary *)paramsDic
                             completion:(void(^)())completion;

#pragma mark - present、dismiss
- (void)present:(NSString *)viewController
       animated:(BOOL)animated
      paramsDic:(NSDictionary *)paramsDic
     completion:(void(^)())completion;

@end
