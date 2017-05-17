//
//  CHPhotoEditViewController.h
//  GPUImageDemo
//
//  Created by chenhao on 16/12/6.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HCPhotoEditViewController;
@protocol HCPhotoEditViewControllerDelegate <NSObject>

@optional
/**
 点击“完成”按钮回调函数
 */
-(void)didClickFinishButtonWithEditController:(HCPhotoEditViewController*)controller  newImage:(UIImage*)newImage;
/**
 点击“取消”按钮回调函数
 */
-(void)didClickCancelButtonWithEditController:(HCPhotoEditViewController*)controller;

@end

@interface HCPhotoEditViewController : UIViewController

@property(nonatomic, strong) UIImage  *oriImage;
@property(nonatomic, weak) id<HCPhotoEditViewControllerDelegate> delegate;


+(UIImage*)resourceImageWithName:(NSString*)name;
+(UIImage*)textureImageWithName:(NSString*)name;

@end
