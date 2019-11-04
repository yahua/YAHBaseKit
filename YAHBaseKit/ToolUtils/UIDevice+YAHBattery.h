//
//  UIDevice+YAHBattery.h
//  YAHBaseKit
//
//  Created by yahua on 2019/11/4.
//  Copyright © 2019 yahua. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,YAHBatteryState) {
    YAHBatteryStateUnknown,
    YAHBatteryStateUnplugged,    //未充电
    YAHBatteryStateCharging,   //正在充电
    YAHBatteryStateFull       //充满电
};

@interface UIDevice (YAHBattery)

/**
 *  当前电池量
 *
 *  @return 0-1
 */
+ (CGFloat)yah_currentBatteryLevel;
/**
 *  电池状态
 *
 *  @return 正在充电、未充电、充满电
 */
+ (YAHBatteryState)yah_batteryState;

@end

NS_ASSUME_NONNULL_END
