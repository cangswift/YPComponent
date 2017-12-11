

#ifndef YPMacro_h
#define YPMacro_h

#import "UIColor+Extension.h"

// debug日志输出
#ifdef EN_Develope
#define Log(...) NSLog(__VA_ARGS__)
#else
#define Log(...)
//#define NSLog(...)
#endif


//屏幕对象
#define SCREEN [UIApplication sharedApplication].keyWindow

//屏幕宽高
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

//iphone各机型判断
#define IS_IPHONE_3_5               CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] bounds].size)
#define IS_IPHONE_4_0               CGSizeEqualToSize(CGSizeMake(320, 568), [[UIScreen mainScreen] bounds].size)
#define IS_IPHONE_4_7               CGSizeEqualToSize(CGSizeMake(375, 667), [[UIScreen mainScreen] bounds].size)
#define IS_IPHONE_5_5               CGSizeEqualToSize(CGSizeMake(414, 736), [[UIScreen mainScreen] bounds].size)
#define IS_IPHONE_5_8               CGSizeEqualToSize(CGSizeMake(375, 812), [[UIScreen mainScreen] bounds].size)

//UI机型尺寸比例（以iphone6为基准）
#define UI_H_SCALE                  SCREEN_WIDTH/375
#define UI_V_SCALE                  SCREEN_HEIGHT/667

#define kWJHeightCoefficient (kScreenHeight == 812.0 ? 667.0/667.0 : kWJScreenHeight/667.0)


//分割线
#define LINE_HEIGHT                 1.f/SCREEN_SCALE
#define LINE_COLOR                  HexRGB(0xeeeeee)

//屏幕物理像素与现实像素比值
#define SCREEN_SCALE                [UIScreen mainScreen].scale

//判断是否是iphone设备
#define IS_PHONE [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone

//字体大小,宏名以iphone6P下的字号为准
#define FONT(x)             [UIFont systemFontOfSize:FONT_SIZE(x)]
#define BOLD_FONT(x)        [UIFont boldSystemFontOfSize:FONT_SIZE(x)]
#define FONT_SIZE(x)        (IS_IPHONE_5_8?x:(IS_IPHONE_5_5?x+1:(IS_IPHONE_4_7?x:x)))

#define TABBAR_HEIGHT           (IS_IPHONE_5_8?83:49)  //tabbar的默认高度
#define STATUSBAR_HEIGHT        (IS_IPHONE_5_8?44:20)  //状态栏高度
#define NAVIGATION_BAR_HEIGHT   (STATUSBAR_HEIGHT+44)  //navigation+statue默认高度

#define NAVIGATION_GUIDE_WIDTH   (IS_IPHONE_4_0?4:10)  //新手引导左右间距


//生成颜色对象
#define HexRGB(rgbValue)            [UIColor colorWithHexRGB:rgbValue alpha:1.0]
#define HexRGBAlpha(rgbValue,a)     [UIColor colorWithHexRGB:rgbValue alpha:a]
#define RGB(r, g, b)                [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)        [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

//获取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:ext]]
//获取当前APP名字
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
//获取当前APP版本号
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//获取当前APPbuild号
#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//获取bundle id
#define APP_BUNDLEID [[NSBundle mainBundle] bundleIdentifier]

//获取本地图片的路径
#define GetImage(name)  [UIImage imageNamed:name]
#define GetImagePath(name)  [UIImage imagePathed:name]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
// status 和 NavBar 的高度
#define StatusBarAndNavBar_Height ([[UIApplication sharedApplication] statusBarFrame].size.height + 44)
// tabar 高度
#define Tabbar_Height ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 83 : 49)
// tabbar 下方的一段高度（iPhone X）
#define Tabbar_Bottom_height ([[UIApplication sharedApplication] statusBarFrame].size.height > 20 ? 34 : 0)


// 解决 block 循环引用问题
#define WeakObj(type) autoreleasepool{} __weak typeof(type) type##Weak = type;
#define StrongObj(type) autoreleasepool{} __strong typeof(type) type = type##Weak;


#define WORD_COLOR_LEVEL_1      HexRGB(0x666666) //字体颜色
#define WORD_COLOR_LEVEL_2      HexRGB(0x999999) //字体颜色
#define WORD_COLOR_LEVEL_3      HexRGB(0xFFFFFF) //字体颜色10 白色
#define WORD_COLOR_LEVEL_4      HexRGB(0x333333) //字体颜色10 黑色
#define WORD_COLOR_LEVEL_5      HexRGB(0xEDEDED) //字体颜色10 线的灰色
#define WORD_COLOR_LEVEL_6      HexRGB(0xFF6F5D) //字体颜色10 线的红色


//新版
#define WORD_COLOR_LEVEL_7      HexRGB(0xE53935) //红色背景和字体颜色
#define WORD_COLOR_LEVEL_8      HexRGB(0x263238) //字体颜色颜色
#define WORD_COLOR_LEVEL_9      HexRGB(0x4A90E2) //热门背景颜色 蓝色
#define WORD_COLOR_LEVEL_10     HexRGB(0xA8ADAF) //浅色字体颜色
#define WORD_COLOR_LEVEL_11     HexRGB(0xF3F3F3) //浅色颜色
#define WORD_COLOR_LEVEL_12     HexRGB(0x263238)//黑色
#define WORD_COLOR_LEVEL_13     HexRGB(0x656F74)//黑色
#define WORD_COLOR_LEVEL_14     HexRGB(0xF3F3F3)//黑色

#define VIEW_BGCOLOR            HexRGB(0xf3f3f3) //默认视图颜色


#define LINE_COLOR1                  HexRGB(0xededed)




#endif /** YPMacro_h */
