//
//  wxShareVC.m
//  wxShareDemo
//
//  Created by 888 on 16/8/26.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "wxShareVC.h"
#import "wxSDK/WXApi.h"

@interface wxShareVC ()

@end

@implementation wxShareVC


/************************* 单例 **********************************/

static id _instance;
//重写allocWithZone:方法，在这里创建唯一的实例(注意线程安全)
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    }
    return _instance;
}

+ (instancetype)sharedInstanceTool{
    @synchronized(self){
        if(_instance == nil){
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}

-(id)copyWithZone:(struct _NSZone *)zone{
    return _instance;
}

/************************* 单例 **********************************/


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)wxShareToType:(int)type andTitle:(NSString *)title andDescription:(NSString *)description andImage:(NSString *)image andUrl:(NSString *)url
{
    //创建发送对象实例
    SendMessageToWXReq *sendReq = [[SendMessageToWXReq alloc] init];
    sendReq.bText = NO;//不使用文本信息
    sendReq.scene = type;//0 = 好友列表 1 = 朋友圈 2 = 收藏
    NSLog(@"分享的种类%d",sendReq.scene);
    //创建分享内容对象
    WXMediaMessage *urlMessage = [WXMediaMessage message];
    urlMessage.title = title;//分享标题
    urlMessage.description = description;//分享描述
    [urlMessage setThumbImage:[UIImage imageNamed:image]];//分享图片,使用SDK的setThumbImage方法可压缩图片大小
    
    //创建多媒体对象
    WXWebpageObject *webObj = [WXWebpageObject object];
    webObj.webpageUrl = url;//分享链接
    
    //完成发送对象实例
    urlMessage.mediaObject = webObj;
    sendReq.message = urlMessage;
    
    //发送分享信息
    [WXApi sendReq:sendReq];
}

@end
