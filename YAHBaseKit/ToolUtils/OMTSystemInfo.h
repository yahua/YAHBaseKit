//
//  OMTSystemInfo.h
//  mobogo
//
//  Created by WangMingfu on 14/10/14.
//  Copyright (c) 2014年 LTZD. All rights reserved.
//


#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

#pragma mark - 设备屏幕尺寸
#define OMT_SCREEN_SIZE                 ([UIScreen mainScreen].bounds.size)
#define OMT_SCREEN_SIZE_WIDTH           ([UIScreen mainScreen].bounds.size.width)
#define OMT_SCREEN_SIZE_HEIGHT          ([UIScreen mainScreen].bounds.size.height)
//当前设备屏幕与4.7英寸屏幕的比例
#define OMT_SCREEN_SCALE_WITH_47_INCH   (OMT_SCREEN_SIZE_WIDTH/375.0F)
//获取当前设备屏幕相对于4.7英寸屏幕的长度
#define OMT_SCALE_ZOOM(f)               (OMT_SCREEN_SCALE_WITH_47_INCH * ((float)f))

//状态栏的高度
#define OMT_STATUSBAR_SPACE             (IS_IPHONE_X ? 44.0f : 20.0f)
//导航栏视图高度(不包含status bar的高度)
#define OMT_NAVIGATIONBAR_SPAGE         (44.0f)
//iPhone X底部栏的高度值
#define OMT_BOTTOM_SPAGE                (34.0f)

//iOS tabbar 高度
#define OMT_TABBAR_HEIGHT               (49.0f)

//status bar的高度,如果全屏模式取到的是0,非全屏数值和OMT_STATUSBAR_SPACE值一样
#define OMT_STATUSBAR_HEIGHT            MIN(([[UIApplication sharedApplication] statusBarFrame].size.height), OMT_STATUSBAR_SPACE)
//导航栏高度(包括status bar的高度)
#define OMT_NAVIGATIONBAR_HEIGHT        (OMT_NAVIGATIONBAR_SPAGE + OMT_STATUSBAR_HEIGHT)
//home底部栏高度,主要是为了适配iPhone X
#define OMT_HOME_INDICATOR_HEIGHT       (IS_IPHONE_X ? OMT_BOTTOM_SPAGE : 0.0f)

#pragma mark -

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#define IOS11_OR_LATER      ( [OMTSystemInfo systemVersionMajorVersion] >= 11.0 )
#define IOS10_OR_LATER        ( [OMTSystemInfo systemVersionMajorVersion] >= 10.0 )
#define IOS9_OR_LATER        ( [OMTSystemInfo systemVersionMajorVersion] >= 9.0 )
#define IOS8_OR_LATER        ( [OMTSystemInfo systemVersionMajorVersion] >= 8.0)
#define IOS7_OR_LATER        ( [OMTSystemInfo systemVersionMajorVersion] >= 7.0 )

#define IOS10_OR_EARLIER    ( !IOS11_OR_LATER )
#define IOS9_OR_EARLIER        ( !IOS10_OR_LATER )
#define IOS8_OR_EARLIER        ( !IOS9_OR_LATER )
#define IOS7_OR_EARLIER        ( !IOS8_OR_LATER )

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
#define IS_IPHONE (    !IS_IPAD )

#define IS_IPHONE4 (IS_SCREEN_35_INCH)
#define IS_IPHONE5 (IS_SCREEN_4_INCH)
#define IS_IPHONE6 (IS_SCREEN_47_INCH)
#define IS_IPHONE6_PLUS (IS_SCREEN_55_INCH)
#define IS_IPHONE_X (IS_SCREEN_IPHONE_X_58_INCH || IS_SCREEN_IPHONE_X_65_INCH || IS_SCREEN_IPHONE_X_61_INCH)

#define IS_SCREEN_IPHONE_X_65_INCH      ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_IPHONE_X_61_INCH      ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_IPHONE_X_58_INCH      ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_55_INCH               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IS_SCREEN_47_INCH               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_4_INCH                ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_35_INCH               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_SCREEN_IPAD_35_INCH          ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] bounds].size) : NO)


#define APP_STATUSBAR_ORIENTATION ([[UIApplication sharedApplication] statusBarOrientation])
#define IS_PORTRAIT   UIInterfaceOrientationIsPortrait(APP_STATUSBAR_ORIENTATION)
#define IS_LANDSCAPE    UIInterfaceOrientationIsLandscape(APP_STATUSBAR_ORIENTATION)


#else    // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#define IOS11_OR_LATER      (NO)
#define IOS10_OR_LATER      (NO)
#define IOS9_OR_LATER        (NO)
#define IOS8_OR_LATER        (NO)
#define IOS7_OR_LATER        (NO)
#define IOS6_OR_LATER        (NO)
#define IOS5_OR_LATER        (NO)
#define IOS4_OR_LATER        (NO)
#define IOS3_OR_LATER        (NO)

#define IOS10_OR_EARLIER    (NO)
#define IOS9_OR_EARLIER     (NO)
#define IOS8_OR_EARLIER     (NO)
#define IOS7_OR_EARLIER     (NO)
#define IOS6_OR_EARLIER     (NO)
#define IOS5_OR_EARLIER     (NO)
#define IOS4_OR_EARLIER     (NO)
#define IOS3_OR_EARLIER     (NO)

#define IS_SCREEN_4_INCH    (NO)
#define IS_SCREEN_35_INCH    (NO)
#define IS_SCREEN_47_INCH    (NO)
#define IS_SCREEN_55_INCH    (NO)
#define IS_SCREEN_IPHONE_X_58_INCH  (NO)

#define IS_IPAD (NO)
#define IS_IPOD (NO)
#define IS_IPHONE (NO)

#define APP_STATUSBAR_ORIENTATION (0)
#define IS_PORTRAIT   (NO)
#define IS_LANDSCAPE  (NO)

#define IS_IPHONE4 (NO)
#define IS_IPHONE5 (NO)
#define IS_IPHONE6 (NO)
#define IS_IPHONE6_PLUS (NO)
#define IS_IPHONE_X (NO)

#endif    // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

