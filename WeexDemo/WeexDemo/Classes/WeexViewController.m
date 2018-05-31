//
//  WeexViewController.m
//  WeexDemo
//
//  Created by 崔冰 on 2018/5/30.
//  Copyright © 2018年 Ziwutong. All rights reserved.
//

#import "WeexViewController.h"
#import "WXSDKInstance.h"

@interface WeexViewController ()
@property (nonatomic, strong) WXSDKInstance *wxInstance;
@property (nonatomic, strong) UIView *wxView;
@property (nonatomic, strong) NSURL *jsUrl;
@property (nonatomic, strong) NSURL *jsHttpUrl;

@end

@implementation WeexViewController

- (instancetype)initWithLocalJsPath:(NSString *)jsLocalPath {
    if (self = [super init]) {
        NSString *path = [NSString stringWithFormat:@"file://%@/%@",[NSBundle mainBundle].bundlePath,jsLocalPath];
        self.jsUrl = [NSURL URLWithString:path];
    }
    return self;
}

- (instancetype)initWithHttpUrlJsPath:(NSString *)jsHttpPath {
    if (self = [super init]) {
        self.jsHttpUrl = [NSURL URLWithString:jsHttpPath];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"测试";
    self.view.backgroundColor = [UIColor whiteColor];
    self.wxInstance = [[WXSDKInstance alloc] init];
    self.wxInstance.viewController = self;
    self.wxInstance.frame = self.view.frame;
    __weak typeof(self) weakSelf = self;
    self.wxInstance.onCreate = ^(UIView *view) {
        [weakSelf.wxView removeFromSuperview];
        weakSelf.wxView = view;
        [weakSelf.view addSubview:weakSelf.wxView];
    };

    self.wxInstance.onFailed = ^(NSError *error) {
        NSLog(@"加载失败啦");
    };
    
    self.wxInstance.renderFinish = ^(UIView *view) {
        NSLog(@"加载成功");
    };
    
    [self loadUrl];
}

- (void)loadUrl {
    if (self.jsHttpUrl) {
        [self.wxInstance renderWithURL:self.jsHttpUrl options:@{@"bundleUrl":[self.jsHttpUrl absoluteString]} data:nil];
    } else if (self.jsUrl) {
        [self.wxInstance renderWithURL:self.jsUrl];
    }
}

@end
