//
//  NSDictionary+YAHUnicode.m
//  YAHBaseKit
//
//  Created by wangshiwen on 2018/12/11.
//

#import "NSDictionary+YAHUnicode.h"
#import "../NSString/NSString+Contains_YAH.h"
#import "../../extobjc/EXTScope.h"

@implementation NSDictionary (YAHUnicode)

+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        YAH_swizzleSelector(class, @selector(description), @selector(YAH_description));
//        YAH_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(YAH_descriptionWithLocale:));
//        YAH_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(YAH_descriptionWithLocale:indent:));
//    });
}

- (NSString *)YAH_description {
    return [[self YAH_description] makeUnicodeToString];
}

- (NSString *)YAH_descriptionWithLocale:(nullable id)locale {
    return [[self YAH_descriptionWithLocale:locale] makeUnicodeToString];
}

- (NSString *)YAH_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self YAH_descriptionWithLocale:locale indent:level] makeUnicodeToString];
}

@end
