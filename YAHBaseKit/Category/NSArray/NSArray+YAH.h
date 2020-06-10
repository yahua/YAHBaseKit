//
//  NSDate+FHExpand.h
//  Fischerhaus
//
//  Created by wangshiwen on 2019/1/4.
//  Copyright © 2019 yahua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 扩展
@interface NSArray (YAH)


/// 获取成员某个属性的集合
/// @param key 具体属性
- (NSArray *)subValueListWithKey:(NSString *)key;


/// 获取成员某个属性的的总数
/// @param key 具体属性
- (CGFloat)subValueCountWithKey:(NSString *)key;


/// 获取成员某个属性的的平均值
/// @param key 具体属性
- (CGFloat)subValueAvgWithKey:(NSString *)key;


/// 获取成员某个属性的最大值
/// @param key 具体属性
- (CGFloat)subValueMaxWithKey:(NSString *)key;


/// 获取成员某个属性的最小值
/// @param key 具体属性
- (CGFloat)subValueMinWithKey:(NSString *)key;



/// //对某一元素进行排序 （降序）
/// @param key 具体属性
- (NSArray *)sortDescWithKey:(NSString *)key;


/// 输出json字符串
- (NSString *)jsonString;

@end

NS_ASSUME_NONNULL_END
