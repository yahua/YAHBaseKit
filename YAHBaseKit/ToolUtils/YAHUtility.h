//
//  Utility.h
//  GB_Football
//
//  Created by weilai on 16/2/18.
//  Copyright © 2016年 GoBrother. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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

@interface YAHUtility : NSObject

extern NSError *makeError(NSInteger errorCode, NSString *description);

// 计算年龄
+ (NSString*)fromDateToAge:(NSDate*)date;

+ (NSString *)appVersion;
+ (NSInteger)appVersionCode;
+ (NSString *)appBundleIdentifier;
// 创建文件
+ (BOOL)createFolderWithFolder:(NSString *)folder;

//Dictionary转string
+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;

// 计算星期几
+ (NSString *)weekFromDate:(long)dateValue;

// 获取当月的天数
+ (NSInteger)getNumberOfDaysInMonth:(NSDate *)date;

// 坐标转换
+ (NSArray *)transformPointArray:(NSArray *)fourPoints origPoints:(NSArray *)origPoints size:(CGSize)size tansX:(BOOL)tansX tansY:(BOOL)transY;

// float转NSString最多保留两位小数
+ (NSString *)float2NSString:(float)value;

+ (UIViewController *)findController:(UINavigationController *)nvc class:(Class)aClass;

@end
