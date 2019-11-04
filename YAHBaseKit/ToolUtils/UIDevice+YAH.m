//
//  UIDevice+YAH.m
//  YAHBaseKit
//
//  Created by yahua on 2019/11/4.
//  Copyright © 2019 yahua. All rights reserved.
//

#import "UIDevice+YAH.h"
#import "sys/utsname.h"

@implementation UIDevice (YAH)


+ (YAHScreenType)screenType
{
    static YAHScreenType screenType = YAHScreenTypeUndefined;
    if (screenType == YAHScreenTypeUndefined)
    {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        int height = MAX(screenBounds.size.width, screenBounds.size.height);
        int width = MIN(screenBounds.size.width, screenBounds.size.height);
        
        int scale = [[UIScreen mainScreen] scale];
        
        if (height == 480 && width == 320)
        {
            if (scale == 1) {
                screenType = YAHScreenTypeClassic;
            } else if (scale == 2){
                screenType = YAHScreenTypeRetina;
            }
        }
        else if (height == 568 && width == 320)
        {
            screenType = YAHScreenTypeRetina4Inch;
        }
        else if (height == 667 && width == 375)
        {
            screenType = YAHScreenTypeIphone6;
        }
        else if (height == 736 && width == 414)
        {
            screenType = YAHScreenTypeIphone6Plus;
        }
        else if (height == 1024 && width == 768)
        {
            if (scale == 1){
                screenType = YAHScreenTypeIpadClassic;
            } else if (scale == 2) {
                screenType = YAHScreenTypeIpadRetina;
            }
        }
        else if (height == 1112 && width == 834)
        {
            screenType = YAHScreenTypeIpadPro;
        }
        else if (height == 1366 && width == 1024)
        {
            screenType = YAHScreenTypeIpadPro;
        }
        else if (height == 812 && width == 375)
        {
            screenType = YAHScreenTypeIphoneX;
        }else if (height == 896 && width == 414)
        {
            screenType = YAHScreenTypeIphoneXR;
        }
    }
    return screenType;
}

+ (BOOL)yah_isIPhone6
{
    return [self screenType] == YAHScreenTypeIphone6;
}

+ (BOOL)yah_isIPhone6Plus
{
    return [self screenType] == YAHScreenTypeIphone6Plus;
}

+ (BOOL)yah_isRetina4Inch
{
    return [self screenType] == YAHScreenTypeRetina4Inch;
}

+ (BOOL)yah_isIPhoneX
{
    return [self screenType] == YAHScreenTypeIphoneX;
}

+ (BOOL)yah_isIPhoneXR
{
    return [self screenType] == YAHScreenTypeIphoneXR;
}

+ (NSString *)yah_deviceName {
    
    // 需要
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
     if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
     if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
     if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
     if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
     if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
     if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
     if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
     if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
     if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
     if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
     if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
     if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
     if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
     if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
     // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
     if ([deviceString isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
     if ([deviceString isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
     if ([deviceString isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
     if ([deviceString isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
     if ([deviceString isEqualToString:@"iPhone10,1"])   return @"国行(A1863)、日行(A1906)iPhone 8";
     if ([deviceString isEqualToString:@"iPhone10,4"])   return @"美版(Global/A1905)iPhone 8";
     if ([deviceString isEqualToString:@"iPhone10,2"])   return @"国行(A1864)、日行(A1898)iPhone 8 Plus";
     if ([deviceString isEqualToString:@"iPhone10,5"])   return @"美版(Global/A1897)iPhone 8 Plus";
     if ([deviceString isEqualToString:@"iPhone10,3"])   return @"国行(A1865)、日行(A1902)iPhone X";
     if ([deviceString isEqualToString:@"iPhone10,6"])   return @"美版(Global/A1901)iPhone X";
     if ([deviceString isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
     if ([deviceString isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
     if ([deviceString isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
     if ([deviceString isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
     if ([deviceString isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
     if ([deviceString isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
     if ([deviceString isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
     
     if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
     if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
     if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
     if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
     if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
     
     if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
     if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
     if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
     if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
     if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
     if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
     if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
     if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
     if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
     if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
     if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
     if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
     if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
     if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
     if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
     if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
     if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
     if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
     if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
     if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
     if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
     if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
     if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
     if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
     if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
     if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
     if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
     if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
     if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
     if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
     if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
     if ([deviceString isEqualToString:@"iPad6,11"])    return @"iPad 5 (WiFi)";
     if ([deviceString isEqualToString:@"iPad6,12"])    return @"iPad 5 (Cellular)";
     if ([deviceString isEqualToString:@"iPad7,1"])     return @"iPad Pro 12.9 inch 2nd gen (WiFi)";
     if ([deviceString isEqualToString:@"iPad7,2"])     return @"iPad Pro 12.9 inch 2nd gen (Cellular)";
     if ([deviceString isEqualToString:@"iPad7,3"])     return @"iPad Pro 10.5 inch (WiFi)";
     if ([deviceString isEqualToString:@"iPad7,4"])     return @"iPad Pro 10.5 inch (Cellular)";
     if ([deviceString isEqualToString:@"iPad7,5"])     return @"iPad 6th generation";
     if ([deviceString isEqualToString:@"iPad7,6"])     return @"iPad 6th generation";
     if ([deviceString isEqualToString:@"iPad8,1"])     return @"iPad Pro (11-inch)";
     if ([deviceString isEqualToString:@"iPad8,2"])     return @"iPad Pro (11-inch)";
     if ([deviceString isEqualToString:@"iPad8,3"])     return @"iPad Pro (11-inch)";
     if ([deviceString isEqualToString:@"iPad8,4"])     return @"iPad Pro (11-inch)";
     if ([deviceString isEqualToString:@"iPad8,5"])     return @"iPad Pro (12.9-inch) (3rd generation)";
     if ([deviceString isEqualToString:@"iPad8,6"])     return @"iPad Pro (12.9-inch) (3rd generation)";
     if ([deviceString isEqualToString:@"iPad8,7"])     return @"iPad Pro (12.9-inch) (3rd generation)";
     if ([deviceString isEqualToString:@"iPad8,8"])     return @"iPad Pro (12.9-inch) (3rd generation)";

     
    if ([deviceString isEqualToString:@"AppleTV2,1"])    return @"Apple TV 2";
    if ([deviceString isEqualToString:@"AppleTV3,1"])    return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV3,2"])    return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV5,3"])    return @"Apple TV 4";

     if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
     if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
     
     return deviceString;
}

@end
