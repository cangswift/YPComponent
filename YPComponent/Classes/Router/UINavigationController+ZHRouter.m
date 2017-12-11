

#import "UINavigationController+ZHRouter.h"
#import "DDRouter.h"

@implementation UINavigationController (ZHRouter)

// push
- (void)zh_PushViewController:(UIViewController *)viewController
                     animated:(BOOL)animated
       isHiddenTabbarWhenPush:(BOOL)isHiddenTabbarWhenPush
                   completion:(void(^)(void))completion{
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    viewController.hidesBottomBarWhenPushed = isHiddenTabbarWhenPush;
    [self pushViewController:viewController animated:animated];
    [CATransaction commit];
}


// pop回上一级
- (void)zh_popViewController:(BOOL)animated completion:(void (^)(void))completion{
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self popViewControllerAnimated:animated];
    [CATransaction commit];
}

// pop到指定控制器
- (void)zh_popToViewController:(UIViewController *)viewController
                      animated:(BOOL)animated
                    completion:(void (^)(void))completion{
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self popToViewController:viewController animated:animated];
    [CATransaction commit];
}

// popToRoot
- (void)zh_popToRootViewController:(BOOL)animated
                        completion:(void(^)(void))completion{
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self popToRootViewControllerAnimated:animated];
    [CATransaction commit];
}
@end
