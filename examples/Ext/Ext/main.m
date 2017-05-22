//
//  main.m
//  HCPhotoEditDemo
//
//  Created by chenhao on 17/2/4.
//  Copyright © 2017年 chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

CFAbsoluteTime StartTime;

int main(int argc, char * argv[]) {
    
    StartTime = CFAbsoluteTimeGetCurrent();
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
