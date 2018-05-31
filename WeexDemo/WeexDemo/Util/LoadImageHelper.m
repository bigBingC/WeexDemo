//
//  LoadImageHelper.m
//  WeexDemo
//
//  Created by 崔冰 on 2018/5/31.
//  Copyright © 2018年 Ziwutong. All rights reserved.
//

#import "LoadImageHelper.h"
#import <SDWebImage/SDWebImageManager.h>
#import "SDWebImageDownloader.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation LoadImageHelper
- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)options completed:(void (^)(UIImage *, NSError *, BOOL))completedBlock {
    if (![self isValidString:url]) {
        return nil;
    }
    //实现加载xcassets 本地资源
    if ([url hasPrefix:@"assets:"]) {
        UIImage *img = [UIImage imageNamed:[url substringFromIndex:7]];
        completedBlock(img,nil,YES);
        return (id<WXImageOperationProtocol>)[NSObject new];
    }
    
    //加载网络资源
    if ([url hasPrefix:@"//"]) {
        url = [@"http:" stringByAppendingString:url];
    }
    
    return (id<WXImageOperationProtocol>)[[SDWebImageManager sharedManager].imageDownloader downloadImageWithURL:[NSURL URLWithString:url] options:SDWebImageDownloaderLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        if (completedBlock) {
            completedBlock(image, error, finished);
        }
    }];
}

- (BOOL)isValidString:(NSString *)str {
    if (str && [str isKindOfClass:[NSString class]] && [str length] > 0) {
        return YES;
    }
    return NO;
}
@end
