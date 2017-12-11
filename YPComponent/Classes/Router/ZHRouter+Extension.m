//

#import "ZHRouter+Extension.h"
#import "TabBarViewController.h"

@implementation DDRouter (Extension)

#pragma mark - getter
- (UIViewController *)activedVC{
    UIViewController *topVC = [TabBarViewController sharedInstance].currVC;
    while (topVC.presentedViewController && ([topVC.presentedViewController isKindOfClass:[UIViewController class]] || [topVC.presentedViewController isKindOfClass:[UINavigationController class]])) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

#pragma mark - 返回根页面
- (void) returnToRoot{
    NSMutableArray *vcs = [NSMutableArray array];
    UIViewController *topVC = [TabBarViewController sharedInstance].currVC;
    if([topVC isKindOfClass:[UINavigationController class]]){
        UINavigationController *nc = (UINavigationController *)topVC;
        [nc popToRootViewControllerAnimated:NO];
    }
    while (topVC.presentedViewController && ([topVC.presentedViewController isKindOfClass:[UIViewController class]] || [topVC.presentedViewController isKindOfClass:[UINavigationController class]])) {
        topVC = topVC.presentedViewController;
        [vcs addObject:topVC];
    }
    for(UIViewController *vc in vcs){
        [vc dismissViewControllerAnimated:NO completion:nil];
    }
}

#pragma mark - push vc
- (void)push:(UIViewController *)vc{
    UIViewController *baseVC = self.activedVC;
    if([baseVC isKindOfClass:[UINavigationController class]]){
        [(UINavigationController *)baseVC pushViewController:vc animated:YES];
    }else if([baseVC isKindOfClass:[UIViewController class]]){
        if(baseVC.navigationController){
            [baseVC.navigationController pushViewController:vc animated:YES];
        }else{
            Log(@"协议执行错误:当前活跃控制器无navigationController！");
        }
    }
}

#pragma mark - present vc
- (void)present:(UIViewController *)vc{
    [self present:vc identifier:nil];
}

//- (void)present:(UIViewController *)vc identifier:(NSString *)identifier{
//    UIViewController *baseVC = self.activedVC;
//    if([vc isKindOfClass:[UINavigationController class]]){
//        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        [baseVC presentViewController:vc animated:YES completion:nil];
//    }else{
//        if([baseVC isKindOfClass:[ZHBaseNC class]]){
//            ZHBNC *baseNC = (ZHBNC *)baseVC;
//            if(identifier && [identifier isEqualToString:baseNC.identifier]){
//                [baseNC pushViewController:vc animated:YES];
//                return;
//            }
//        }
//        ZHBNC *navi = [[ZHBNC alloc]initWithRootViewController:vc];
//        navi.identifier = identifier;
//        navi.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        [baseVC presentViewController:navi animated:YES completion:nil];
//
//    }
//}

#pragma mark - dismiss vc
//- (void) dismissShowedNavWithIdentifier:(NSString *)identifier complete:(void(^)(void))complete{
//    ZHBNC *baseNC = (ZHBNC *)self.activedVC;
//    if([identifier isEqualToString:baseNC.identifier]){
//        [baseNC dismissViewControllerAnimated:YES
//                                   completion:^{
//                                       !complete ? : complete();
//                                   }];
//    }else{
//        !complete ? : complete();
//    }
//}

@end
