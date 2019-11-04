//
//  UIDevice+YAH.h
//  YAHBaseKit
//
//  Created by yahua on 2019/11/4.
//  Copyright © 2019 yahua. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 设备屏幕尺寸
#define YAH_SCREEN_SIZE                 ([UIScreen mainScreen].bounds.size)
#define YAH_SCREEN_SIZE_WIDTH           ([UIScreen mainScreen].bounds.size.width)
#define YAH_SCREEN_SIZE_HEIGHT          ([UIScreen mainScreen].bounds.size.height)
//当前设备屏幕与4.7英寸屏幕的比例
#define YAH_SCREEN_SCALE_WITH_47_INCH   (YAH_SCREEN_SIZE_WIDTH/375.0F)
//获取当前设备屏幕相对于4.7英寸屏幕的长度
#define YAH_SCALE_ZOOM(f)               (YAH_SCREEN_SCALE_WITH_47_INCH * ((float)f))

#define IS_IPHONE_X                     ([UIDevice yah_isIPhoneX] || [UIDevice yah_isIPhoneXR])
//状态栏的高度
#define YAH_STATUSBAR_SPACE             (IS_IPHONE_X ? 44.0f : 20.0f)
//导航栏视图高度(不包含status bar的高度)
#define YAH_NAVIGATIONBAR_SPAGE         (44.0f)
//iPhone X底部栏的高度值
#define YAH_BOTTOM_SPAGE                (34.0f)

//iOS tabbar 高度
#define YAH_TABBAR_HEIGHT               (49.0f)

//status bar的高度,如果全屏模式取到的是0,非全屏数值和YAH_STATUSBAR_SPACE值一样
#define YAH_STATUSBAR_HEIGHT            MIN(([[UIApplication sharedApplication] statusBarFrame].size.height), YAH_STATUSBAR_SPACE)
//导航栏高度(包括status bar的高度)
#define YAH_NAVIGATIONBAR_HEIGHT        (YAH_NAVIGATIONBAR_SPAGE + YAH_STATUSBAR_HEIGHT)
//home底部栏高度,主要是为了适配iPhone X
#define YAH_HOME_INDICATOR_HEIGHT       (IS_IPHONE_X ? YAH_BOTTOM_SPAGE : 0.0f)

typedef NS_ENUM(NSUInteger, YAHScreenType)
{
    YAHScreenTypeUndefined   = 0,
    YAHScreenTypeIpadClassic = 1,//iPad 1,2,mini
    YAHScreenTypeIpadRetina  = 2,//iPad 3以上,mini2以上
    YAHScreenTypeIpadPro     = 3,//iPad Pro
    YAHScreenTypeClassic     = 4,//3gs及以下
    YAHScreenTypeRetina      = 5,//4&4s
    YAHScreenTypeRetina4Inch = 6,//5&5s&5c
    YAHScreenTypeIphone6     = 7,//6或者6+放大模式
    YAHScreenTypeIphone6Plus = 8,//6+
    YAHScreenTypeIphoneX     = 9,//iphone X
    YAHScreenTypeIphoneXR    = 10,//iphone XR
};


@interface UIDevice (YAH)

//当前屏幕类型
+ (YAHScreenType)screenType;

/**
 * 判断当前屏幕是否为4英寸Retina屏
 *
 * @return BOOL类型YES or NO.
 */
+ (BOOL)yah_isRetina4Inch;

/**
 * 判断当前屏幕是否为iphone6尺寸屏
 *
 * @return BOOL类型YES or NO.
 */
+ (BOOL)yah_isIPhone6;

/**
 * 判断当前屏幕是否为iphone6Plus尺寸屏
 *
 * @return BOOL类型YES or NO.
 */
+ (BOOL)yah_isIPhone6Plus;

/**
 * 判断当前屏幕是否为 iphoneX 尺寸屏
 *
 * @return BOOL类型YES or NO.
 */
+ (BOOL)yah_isIPhoneX;

/**
 * 判断当前屏幕是否为 iphoneXR 尺寸屏
 *
 * @return BOOL类型YES or NO.
 */
+ (BOOL)yah_isIPhoneXR;

//获取当前设备名称
+ (NSString *)yah_deviceName;

@end

NS_ASSUME_NONNULL_END
