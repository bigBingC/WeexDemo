//
//  ViewController.m
//  WeexDemo
//
//  Created by 崔冰 on 2018/5/30.
//  Copyright © 2018年 Ziwutong. All rights reserved.
//

#import "ViewController.h"
#import "WeexViewController.h"
#import <WeexSDK/WXSDKInstance.h>
#import "LoadImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)didPressedWeexBtn:(id)sender {
    WeexViewController *weexVc = [[WeexViewController alloc] initWithLocalJsPath:@"about.weex.js"];
    [self.navigationController pushViewController:weexVc animated:YES];
}

- (IBAction)didpressedWeexHttp:(id)sender {
    WeexViewController *weexVc = [[WeexViewController alloc] initWithHttpUrlJsPath:@"http://7xvsjr.com1.z0.glb.clouddn.com/index.js"];
    [self.navigationController pushViewController:weexVc animated:YES];
}

- (IBAction)didPressedLoadImgBtn:(id)sender {
    LoadImageViewController *loadImgVc = [[LoadImageViewController alloc] initWithJsPath:@"loadImage.js"];
    loadImgVc.title = @"加载图片";
    [self.navigationController pushViewController:loadImgVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
