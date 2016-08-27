//
//  ViewController.m
//  wxShareDemo
//
//  Created by 888 on 16/8/26.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "ViewController.h"

#import "wxShareVC.h"

#import "wxSDK/WXApi.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

//分享到好友
- (IBAction)shareFriedn:(id)sender {
    
    [[wxShareVC sharedInstanceTool] wxShareToType:0 andTitle:@"分享标题" andDescription:@"分享内容" andImage:@"testImg" andUrl:@"www.ez360.cn"];
    
}

//分享到朋友圈
- (IBAction)shareQuan:(id)sender {
    
    [[wxShareVC sharedInstanceTool] wxShareToType:1 andTitle:@"分享标题" andDescription:@"分享内容" andImage:@"testImg" andUrl:@"www.ez360.cn"];
    
}

@end
