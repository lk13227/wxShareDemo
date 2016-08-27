//
//  wxShareVC.h
//  wxShareDemo
//
//  Created by 888 on 16/8/26.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wxShareVC : UIViewController

+ (instancetype)sharedInstanceTool;

- (void)wxShareToType:(int)type andTitle:(NSString *)title andDescription:(NSString *)description andImage:(NSString *)image andUrl:(NSString *)url;

@end
