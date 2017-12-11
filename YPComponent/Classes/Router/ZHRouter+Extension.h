
#import "DDRouter.h"

@interface DDRouter (Extension)

/**当前激活的主视图控制器*/
@property (nonatomic , strong , readonly) UIViewController *activedVC;

/**返回根页面,不改变MainTab的当前选中页*/
- (void) returnToRoot;

//界面跳转方法
- (void)push:(UIViewController *)vc;
- (void)present:(UIViewController *)vc;
- (void)present:(UIViewController *)vc identifier:(NSString *)identifier;

@end
