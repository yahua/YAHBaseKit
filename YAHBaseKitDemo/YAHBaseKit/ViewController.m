//
//  ViewController.m
//  YAHBaseKit
//
//  Created by wangshiwen on 2018/11/27.
//  Copyright © 2018 yahua. All rights reserved.
//

#import "ViewController.h"
#import "YAHBaseKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *test = @"test";
    NSLog(@"%@", [test base64EncodedString]);
    
}


@end
