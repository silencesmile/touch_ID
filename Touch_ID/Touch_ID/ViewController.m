//
//  ViewController.m
//  Touch_ID
//
//  Created by youngstar on 16/1/25.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test];
}

- (void)test
{
    // 实例化
    LAContext *lac = [[LAContext alloc]init];
    
    // 判断设备是否支持指纹识别
    BOOL isSupport = [lac canEvaluatePolicy:(LAPolicyDeviceOwnerAuthenticationWithBiometrics) error:NULL];
    
    if(!isSupport)
    {
        NSLog(@"不支持！");
        return;
    }
    [lac evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请按手印" reply:^(BOOL success, NSError *error) {
        if(success)
        {
            NSLog(@"成功后，处理接下来的逻辑");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
