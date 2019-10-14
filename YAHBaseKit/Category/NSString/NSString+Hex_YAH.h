//
//  NSString+Hex_YAH.h
//  YAHBaseKit
//
//  Created by yahua on 2019/10/14.
//  Copyright © 2019 yahua. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Hex_YAH)

- (instancetype)yah_convertToHexFromASCII;
- (instancetype)yah_ASCIIStringFromHexString;

- (instancetype)yah_hexStringFromString;
- (instancetype)yah_stringFromHexString;

//普通字符串转换为十六进制的。
- (NSData *)yah_dataFromHexString;
- (NSData *)yah_dataFromHexStringWithIsLSB:(BOOL)isLSB; //是否末尾填充0
+ (NSString *)yah_hexStringFromData:(NSData *)data;

// 十进制转十六进制
+ (NSString *)yah_hexStringFromDecimal:(NSInteger)decimal;
// 十六进制转十进制
- (NSInteger)yah_decimalWithHexString;

/*!
 * @method undecoratedHexString
 *
 * @discussion Returns raw HEX string without 0x prefix and inner spaces.
 *
 */
-(instancetype)yah_undecoratedHexString;

/*!
 * @method decoratedHexStringLSB
 *
 * @discussion Returns HEX string prepended with 0x.
 *
 */
-(instancetype)yah_decoratedHexStringLSB:(BOOL)isLSB;

/*!
 * @method paddedHexStringLSB
 *
 * @discussion Returns HEX string padded with 0 if odd number of digits.
 *
 */
-(instancetype)yah_paddedHexStringLSB:(BOOL)isLSB;

@end

NS_ASSUME_NONNULL_END
