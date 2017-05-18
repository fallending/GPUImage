//
//  NSObject+Many.m
//  Ext
//
//  Created by fallen.ink on 18/05/2017.
//  Copyright © 2017 chenhao. All rights reserved.
//

#import "NSObject+Many.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation NSObject (Many)

- (void)save:(NSURL *)url toLibrary:(void (^)(NSError *error))completionHandler {
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library writeVideoAtPathToSavedPhotosAlbum:url
                                completionBlock:^(NSURL *assetURL, NSError *error) {
                                    if (completionHandler) completionHandler(error);
                                }];
}

@end
