//
//  UIDevice+YAHBattery.m
//  YAHBaseKit
//
//  Created by yahua on 2019/11/4.
//  Copyright © 2019 yahua. All rights reserved.
//

#import "UIDevice+YAHBattery.h"


@implementation UIDevice (YAHBattery)

+ (CGFloat)yah_currentBatteryLevel {
    
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    double deviceLevel = [UIDevice currentDevice].batteryLevel;
    return deviceLevel;
}
/**
 *  电池状态
 *
 *  @return 正在充电、未充电、充满电
 */
+ (YAHBatteryState)yah_batteryState {
    
    switch ([self currentDevice].batteryState) {
        case UIDeviceBatteryStateFull:
            return YAHBatteryStateFull;
            break;
        case UIDeviceBatteryStateUnknown:
            return YAHBatteryStateUnknown;
            break;
        case UIDeviceBatteryStateCharging:
            return YAHBatteryStateCharging;
            break;
        case UIDeviceBatteryStateUnplugged:
            return YAHBatteryStateUnplugged;
            break;
        default:
            return YAHBatteryStateUnknown;
            break;
    }
}

@end
