//
//  AppDelegate+weex.m
//  WeexDemo
//
//  Created by 崔冰 on 2018/5/30.
//  Copyright © 2018年 Ziwutong. All rights reserved.
//

#import "AppDelegate+weex.h"
#import <WeexSDK/WeexSDK.h>
#import <WeexSDK/WXSDKInstance.h>
#import "LoadImageHelper.h"

@implementation AppDelegate (weex)
- (void)initWeex {
    [WXSDKEngine initSDKEnvironment];
    //weex加载图片需要注册
    [WXSDKEngine registerHandler:[LoadImageHelper new] withProtocol:@protocol(WXImgLoaderProtocol)];
    [WXLog setLogLevel: WXLogLevelAll];
    
}
@end
