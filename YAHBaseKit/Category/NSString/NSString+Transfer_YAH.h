//
//  NSString+Transfer.h
//  YHCommonDemo
//
//  Created by yahua on 16/5/23.
//  Copyright © 2016年 wangsw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Transfer_YAH)

/**
 *获取汉字拼音的首字母, 返回的字母是大写形式, 例如: @"俺妹", 返回 @"A".
 *如果字符串开头不是汉字, 而是字母, 则直接返回该字母, 例如: @"b彩票", 返回 @"B".
 *如果字符串开头不是汉字和字母, 则直接返回 @"#", 例如: @"&哈哈", 返回 @"#".
 *字符串开头有特殊字符(空格,换行)不影响判定, 例如@"       a啦啦啦", 返回 @"A".
 */
- (NSString *)firstCharPinyinFirstLetter;

/** 校正手机号*/
- (NSString *)adjustmentPhone;

/// 删除字符串的空格
- (NSString *)removeSpace;

/// 字符串防止nil处理，如果是nil则返回空
/// @param orgString 处理前的字符串
+ (NSString *)yah_formalNilString:(NSString *)orgString;

@end
