//
//  SmartViewController.m
//  SmartVideo
//
//  Created by yindongbo on 17/1/5.
//  Copyright © 2017年 Nxin. All rights reserved.
//

#import "SmartViewController.h"
#import "MBSmartVideoView.h"
#import "MBPlaySmartVideoViewController.h"
#import "DownLoadManager.h"
#import "HUBProcessView.h"
#import "WXSmartVideoView.h"
#import "WXVideoPreviewViewController.h"
#import "Ext-precompile.h"

@interface SmartViewController ()

@end

@implementation SmartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = NO;
}

// 半屏录制
- (IBAction)action:(UIButton *)sender {
//    MBSmartVideoView *smart = [[MBSmartVideoView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    NSLog(@".frame == %@", NSStringFromCGRect(smart.frame));
//    [self.navigationController.view addSubview:smart];
//    __weak __typeof(&*self)weakSelf = self;
//    [smart setFinishedRecordBlock:^(NSDictionary *info) {
//        weakSelf.videoUrll = [[info objectForKey:@"videoURL"] description];
//        [weakSelf uploadFileWithURL:weakSelf.videoUrll];
//    }];
}

// 播放视频
- (IBAction)playVideo:(UIButton *)sender {
    {
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
        MBPlaySmartVideoViewController *playVC =[[MBPlaySmartVideoViewController alloc] init];
        playVC.videoUrlString = @"视频的url";
        [self.navigationController pushViewController:playVC animated:YES];
    }
}

- (void)uploadFileWithURL:(NSString *)url{
        [DownLoadManager   qnFileUploadWithPath:url result:^(NSString *url, NSString *m, NSInteger code) {
            
        }];
}

@end
