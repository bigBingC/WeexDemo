//
//  LoadImageViewController.m
//  WeexDemo
//
//  Created by 崔冰 on 2018/5/31.
//  Copyright © 2018年 Ziwutong. All rights reserved.
//

#import "LoadImageViewController.h"
#import <WeexSDK/WXSDKInstance.h>

@interface LoadImageViewController ()
@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;
@property (nonatomic, strong) NSURL *jsUrl;
@end

@implementation LoadImageViewController

- (instancetype)initWithJsPath:(NSString *)jsPath {
    if (self = [super init]) {
        NSString *path = [NSString stringWithFormat:@"file://%@/%@",[NSBundle mainBundle].bundlePath,jsPath];
        self.jsUrl = [NSURL URLWithString:path];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBaseView];
}

- (void)createBaseView {
    self.view.backgroundColor = [UIColor whiteColor];
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = CGRectMake(0, 100, self.view.frame.size.width, 400);
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    
    _instance.onFailed = ^(NSError *error) {
        NSLog(@"加载失败");
    };
    
    _instance.renderFinish = ^(UIView *view) {
        NSLog(@"加载完成");
    };
    [_instance renderWithURL:self.jsUrl];
}


@end
