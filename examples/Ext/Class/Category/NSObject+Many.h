//
//  NSObject+Many.h
//  Ext
//
//  Created by fallen.ink on 18/05/2017.
//  Copyright © 2017 chenhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Many)

- (void)save:(NSURL *)url toLibrary:(void(^)(NSError *error))completionHandler;

@end
