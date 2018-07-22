//
//  HIImageDownloadManager.m
//  RunLoopDemo
//
//  Created by Li, Havi X. -ND on 7/16/18.
//  Copyright © 2018 Li, Havi X. -ND. All rights reserved.
//

#import "HIImageDownloadManager.h"



@implementation HIImageDownloadManager

- (void)downloadImage:(NSURL *)imageurl completeBlock:(CompleteDownload)complete
{
    NSString *key = [imageurl absoluteString];
    NSString *cache = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *cacheString = [cache stringByAppendingString:key];
    
    NSData *image = [NSData dataWithContentsOfFile:cacheString];
    if (image) {
        complete(image);
    } else {
        NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:imageurl
                completionHandler:^(NSData *data,
                                    NSURLResponse *response,
                                    NSError *error) {
                    
                }] resume];
        
    }
    
}
@end
