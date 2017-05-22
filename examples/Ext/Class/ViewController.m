//
//  ViewController.m
//  HCPhotoEditDemo
//
//  Created by chenhao on 17/2/4.
//  Copyright © 2017年 chenhao. All rights reserved.
//

#import <MobileCoreServices/MobileCoreServices.h>
#import "ViewController.h"
#import "HCPhotoEditViewController.h"
#import "CLFilterViewController.h"
#import "OEPopVideoController.h"
#import "Ext-precompile.h"
#import "Ext-Swift.h"
#import "SmartViewController.h"
#import "MBPlaySmartVideoViewController.h"
#import "WXSmartVideoView.h"

extern CFAbsoluteTime StartTime;

@interface ViewController ()<HCPhotoEditViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, OEPopVideoControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"Viewed in %f seconds.", (CFAbsoluteTimeGetCurrent() - StartTime));
    });
}

#pragma mark - Action handler

- (IBAction)onSelect {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes =  [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie, kUTTypeImage,nil];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)onRecord:(id)sender {
    OEPopVideoController *videoController = [[OEPopVideoController alloc] init];
    videoController.videoMaxTime = 4;
    videoController.delegate = self;
    [videoController presentPopupControllerAnimated:YES];
}

- (IBAction)onWechat:(id)sender {
//    SmartViewController *viewController = [[SmartViewController alloc] init];
//    
//    [self.navigationController pushViewController:viewController animated:YES];
    
    WXSmartVideoView *wxsmartView = [[WXSmartVideoView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) GPUImage:YES];
    [self.navigationController.view addSubview:wxsmartView];
}

#pragma mark - UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSString *mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString*)kUTTypeMovie]) {
        NSString *videoPath = (NSString *)[[info objectForKey:UIImagePickerControllerMediaURL] path];
        if (videoPath == nil) {
            NSLog(@"导入出错");
            [picker popToRootViewControllerAnimated:YES];
        } else {
            CLFilterViewController *filter = [[CLFilterViewController alloc] init];
            filter.videoUrl = [NSURL fileURLWithPath:videoPath];
            [picker dismissViewControllerAnimated:YES completion:^{
                [self presentViewController:filter animated:YES completion:nil];
            }];
        }
    } else if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image;
        //如果允许编辑则获得编辑后的照片，否则获取原始照片
        if (picker.allowsEditing) {
            image = [info objectForKey:UIImagePickerControllerEditedImage];//获取编辑后的照片
        } else {
            image = [info objectForKey:UIImagePickerControllerOriginalImage];//获取原始照片
        }
        
        HCPhotoEditViewController *editController = [[HCPhotoEditViewController alloc] init];
        editController.oriImage = image;
        editController.delegate = self;
        
        [picker dismissViewControllerAnimated:YES completion:^{
            [self presentViewController:editController animated:YES completion:nil];
        }];
    }
}


#pragma mark - HCPhotoEditViewControllerDelegate

- (void)didClickFinishButtonWithEditController:(HCPhotoEditViewController *)controller newImage:(UIImage *)newImage {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)didClickCancelButtonWithEditController:(HCPhotoEditViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - OEPopVideoControllerDelegate

- (void)popVideoControllerDidSave:(NSString *)url{
    [self save:[NSURL URLWithString:url] toLibrary:nil];
}

- (void)popVideoControllerWillOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer {
    
}

@end
