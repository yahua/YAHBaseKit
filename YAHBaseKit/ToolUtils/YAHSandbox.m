//
//  YAHSandbox.m
//  YAHBaseKit
//
//  Created by yahua on 2019/8/2.
//  Copyright © 2019 yahua. All rights reserved.
//

#import "YAHSandbox.h"

@interface YAHSandbox()

@property (nonatomic, copy) NSString *    appPath;
@property (nonatomic, copy) NSString *    docPath;
@property (nonatomic, copy) NSString *    libPrefPath;
@property (nonatomic, copy) NSString *    libCachePath;
@property (nonatomic, copy) NSString *    tmpPath;

@end

@implementation YAHSandbox

+ (instancetype)sharedInstance {
    
    static YAHSandbox *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [YAHSandbox new];
    });
    return instance;
}

+ (NSString *)appPath
{
    return [[YAHSandbox sharedInstance] appPath];
}

- (NSString *)appPath
{
    if ( nil == _appPath )
    {
        NSError * error = nil;
        NSArray * paths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:NSHomeDirectory() error:&error];
        
        for ( NSString * path in paths )
        {
            if ( [path hasSuffix:@".app"] )
            {
                _appPath = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), path];
                break;
            }
        }
    }
    
    return _appPath;
}

+ (NSString *)docPath
{
    return [[YAHSandbox sharedInstance] docPath];
}

- (NSString *)docPath
{
    if ( nil == _docPath )
    {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        _docPath = [paths objectAtIndex:0];
    }
    
    return _docPath;
}

+ (NSString *)libPrefPath
{
    return [[YAHSandbox sharedInstance] libPrefPath];
}

- (NSString *)libPrefPath
{
    if ( nil == _libPrefPath )
    {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        NSString * path = [[paths objectAtIndex:0] stringByAppendingFormat:@"/Preferences"];
        
        _libPrefPath = path;
    }
    
    return _libPrefPath;
}

+ (NSString *)libCachePath
{
    return [[YAHSandbox sharedInstance] libCachePath];
}

- (NSString *)libCachePath
{
    if ( nil == _libCachePath )
    {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        NSString * path = [[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
        
        _libCachePath = path;
    }
    
    return _libCachePath;
}

+ (NSString *)tmpPath
{
    return [[YAHSandbox sharedInstance] tmpPath];
}

- (NSString *)tmpPath
{
    if ( nil == _tmpPath )
    {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        NSString * path = [[paths objectAtIndex:0] stringByAppendingFormat:@"/tmp"];
        
        _tmpPath = path;
    }
    
    return _tmpPath;
}


@end
