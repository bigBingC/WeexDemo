//
//  WeexViewController.h
//  WeexDemo
//
//  Created by 崔冰 on 2018/5/30.
//  Copyright © 2018年 Ziwutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeexViewController : UIViewController
- (instancetype)initWithLocalJsPath:(NSString *)jsLocalPath;
- (instancetype)initWithHttpUrlJsPath:(NSString *)jsHttpPath;
@end
