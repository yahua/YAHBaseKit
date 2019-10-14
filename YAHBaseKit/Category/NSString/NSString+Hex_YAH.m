//
//  NSString+Hex_YAH.m
//  YAHBaseKit
//
//  Created by yahua on 2019/10/14.
//  Copyright © 2019 yahua. All rights reserved.
//

#import "NSString+Hex_YAH.h"

@implementation NSString (Hex_YAH)

- (instancetype)yah_convertToHexFromASCII {
    
    NSString *hexString = @"";
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *tempHexString = [NSString yah_hexStringFromData:data];
    tempHexString = [tempHexString uppercaseString];
    for (int i=0; i<tempHexString.length; i+=2) {
        
        NSString *hexValue = [tempHexString substringWithRange:NSMakeRange(i, 2)];
        hexString = [hexString stringByAppendingString:[NSString stringWithFormat:@"0x%@ ",hexValue]];
    }
    
    return hexString;
}
- (instancetype)yah_ASCIIStringFromHexString {
    
    NSData *data = [[self yah_undecoratedHexString] yah_dataFromHexString];
    NSMutableString *string = [NSMutableString stringWithString:@""];
    for (int i = 0; i < data.length; i++)
    {
        unsigned char byte;
        [data getBytes:&byte range:NSMakeRange(i, 1)];
        
        if (byte >= 32 && byte < 127)
        {
            [string appendFormat:@"%c", byte];
        }
    }
    return string;
}

- (instancetype)yah_hexStringFromString {
    
    NSData *myD = [self dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}
- (instancetype)yah_stringFromHexString {
    
    if (self.length == 0) {
        return @"";
    }
    
    char *myBuffer = (char *)malloc((int)[self length] / 2 + 1);
    bzero(myBuffer, [self length] / 2 + 1);
    for (int i = 0; i < [self length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [self substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    return unicodeString;
}

- (NSData *)yah_dataFromHexString {
    
    return [self yah_dataFromHexStringWithIsLSB:YES];
}
- (NSData *)yah_dataFromHexStringWithIsLSB:(BOOL)isLSB { //是否末尾填充0
    
    NSMutableData *data = [NSMutableData new];
    NSString *string = [self stringByReplacingOccurrencesOfString:@" " withString:@""];//Removing spaces
    string = [string lowercaseString];//Lowercase
    NSCharacterSet *illegalSymbols = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdef"] invertedSet];
    
    // Check whether the string is a valid hex string, otherwise return empty data
    if ([string rangeOfCharacterFromSet:illegalSymbols].location == NSNotFound) {
        // Pad to complete bytes
        string = [self yah_paddedHexStringLSB:isLSB];
        
        unsigned char wholeByte;
        char byteChars[3] = {'\0','\0','\0'};
        
        if (isLSB) {
            for (int i = 0, n = (int)string.length; i < n - 1; i += 2) {
                byteChars[0] = [string characterAtIndex:i];
                byteChars[1] = [string characterAtIndex:i + 1];
                wholeByte = strtol(byteChars, NULL, 16);
                [data appendBytes:&wholeByte length:1];
            }
        } else {
            for (int n = (int)string.length, i = n - 2; i >= 0; i -= 2) {
                byteChars[0] = [string characterAtIndex:i];
                byteChars[1] = [string characterAtIndex:i + 1];
                wholeByte = strtol(byteChars, NULL, 16);
                [data appendBytes:&wholeByte length:1];
            }
        }
    }
    return data;
}
+ (NSString *)yah_hexStringFromData:(NSData *)data {
    
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    return string;
}

// 十进制转十六进制
+ (NSString *)yah_hexStringFromDecimal:(NSInteger)decimal {
    
    NSString *hex =@"";
    NSString *letter;
    NSInteger number;
    for (int i = 0; i<999; i++) {
        
        number = decimal % 16;
        decimal = decimal / 16;
        switch (number) {
                
            case 10:
                letter =@"A"; break;
            case 11:
                letter =@"B"; break;
            case 12:
                letter =@"C"; break;
            case 13:
                letter =@"D"; break;
            case 14:
                letter =@"E"; break;
            case 15:
                letter =@"F"; break;
            default:
                letter = [NSString stringWithFormat:@"%ld", number];
        }
        hex = [letter stringByAppendingString:hex];
        if (decimal == 0) {
            
            break;
        }
    }
    return hex;
}
// 十六进制转十进制
- (NSInteger)yah_decimalWithHexString {
    
    unsigned long long result = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanHexLongLong:&result];
    
    return result;
}

/*!
 * @method undecoratedHexString
 *
 * @discussion Returns raw HEX string without 0x prefix and inner spaces.
 *
 */
- (NSString *)yah_undecoratedHexString {
    
    NSMutableString *undecorated = [NSMutableString stringWithString:self];
    [undecorated replaceOccurrencesOfString:@"0x" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, undecorated.length)];
    [undecorated replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, undecorated.length)];
    return undecorated;
}

/*!
 * @method decoratedHexStringLSB
 *
 * @discussion Returns HEX string prepended with 0x.
 *
 */
- (NSString *)yah_decoratedHexStringLSB:(BOOL)isLSB {
    
    //First undecorate...
    NSString *undecorated = [self yah_undecoratedHexString];
    //Pad with 0
    NSString *padded = [undecorated yah_paddedHexStringLSB:isLSB];
    //...then decorate back
    NSMutableString *decorated = [NSMutableString stringWithString:padded];
    if (decorated.length > 0) {
        for (int count = 0, n = decorated.length * 0.5, i = 0; count < n; ++count, i += 5) {
            [decorated insertString:@" 0x" atIndex:i];
        }
        [decorated replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];//Remove initial space
    }
    return decorated;
}

/*!
 * @method paddedHexStringLSB
 *
 * @discussion Returns HEX string padded with 0 if odd number of digits.
 *
 */
- (NSString *)yah_paddedHexStringLSB:(BOOL)isLSB {
    
    NSMutableString *padded = [NSMutableString stringWithString:self];
    if (padded.length % 2 != 0) {//Odd number of digits
        if (isLSB) {//Prepend 0 to the last byte (0x123 -> 0x1203)
            [padded insertString:@"0" atIndex:(padded.length - 1)];
        } else  {//Prepend 0 to the first byte (0x123 -> 0x0123)
            [padded insertString:@"0" atIndex:0];
        }
    }
    return padded;
}


@end
