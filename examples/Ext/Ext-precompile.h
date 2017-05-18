//
//  Ext-precompile.h
//  Ext
//
//  Created by fallen.ink on 17/05/2017.
//  Copyright © 2017 chenhao. All rights reserved.
//

#import "GPUImage.h"
#import "MBProgressHUD.h"
#import "NSString+date.h"
#import "UIImage+color.h"
#import "NSObject+Many.h"

/* CustomFilter */
#import "TBBlackWhiteFiter.h" // 黑白
#import "TBLOMOFilter.h" //lomo
#import "TBFreeFilter.h" //清新
#import "TBSexyFilter.h" //性感
#import "TBAmatorkaFilter.h"
#import "TBSoftEleganceFilter.h"

#pragma mark - Delete Files/Directory
static inline void deleteFilesAt(NSString *directory, NSString *suffixName)
{
    NSError *err = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:directory];
    NSString *toDelFile;
    while (toDelFile = [dirEnum nextObject])
    {
        NSComparisonResult result = [[toDelFile pathExtension] compare:suffixName options:NSCaseInsensitiveSearch|NSNumericSearch];
        if (result == NSOrderedSame)
        {
            NSLog(@"removing file：%@", toDelFile);
            
            if(![fileManager removeItemAtPath:[directory stringByAppendingPathComponent:toDelFile] error:&err])
            {
                NSLog(@"Error: %@", [err localizedDescription]);
            }
        }
    }
}

#pragma mark - Delete Temp Files
static inline void deleteTempDirectory()
{
    NSString *dir = NSTemporaryDirectory();
    deleteFilesAt(dir, @"mp4");
    deleteFilesAt(dir, @"mov");
}


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kNavgationHeight 64.0

#define KImageName(name) [UIImage imageNamed:(name)]
#define FilterScrollHight 72.0f // 滤镜scrollView的高度
#define FilterImageHight 58.0f // 滤镜图片高度

#define color_with_rgb(R,G,B)   [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define image_named(X)          [HCPhotoEditViewController resourceImageWithName:X]
#define texture_named(X)        [HCPhotoEditViewController textureImageWithName:X]

