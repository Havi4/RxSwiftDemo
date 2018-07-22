//
//  HIImageDownloadManager.h
//  RunLoopDemo
//
//  Created by Li, Havi X. -ND on 7/16/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CompleteDownload)(NSData *image);

@interface HIImageDownloadManager : NSObject

+ (instancetype)shareInstance;

- (void)downloadImage:(NSURL *)imageurl completeBlock:(CompleteDownload)complete;

@end
