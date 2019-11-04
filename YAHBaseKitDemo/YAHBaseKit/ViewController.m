//
//  ViewController.m
//  YAHBaseKit
//
//  Created by wangshiwen on 2018/11/27.
//  Copyright © 2018 yahua. All rights reserved.
//

#import "ViewController.h"
#import "YAHBaseKit.h"
#import "sys/utsname.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *test = @"test";
    NSLog(@"%@", [test base64EncodedString]);
    
    YAHLog(@"%@", [YAHSandbox docPath]);
    YAHLog(@"%@", [YAHSandbox libCachePath]);
    YAHLog(@"%@", [YAHSandbox tmpPath]);
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    YAHLog(@"yah_isIPhoneX %@", @([UIDevice yah_isIPhoneX]));
    YAHLog(@"yah_isIPhoneXR %@", @([UIDevice yah_isIPhoneXR]));
    YAHLog(@"yah_isIPhone6 %@", @([UIDevice yah_isIPhone6]));
    
}


@end
