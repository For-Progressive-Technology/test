//
//  NetworkSpeedMonitor.h
//  Test
//
//  Created by Effort on 2020/2/26.
//  Copyright © 2020 Effort. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const NetworkDownloadSpeedNotificationKey;
extern NSString *const NetworkUploadSpeedNotificationKey;
extern NSString *const NetworkSpeedNotificationKey;

@interface NetworkSpeedMonitor : NSObject

@property (nonatomic, copy, readonly) NSString *downloadNetworkSpeed;
@property (nonatomic, copy, readonly) NSString *uploadNetworkSpeed;

- (void)startNetworkSpeedMonitor;
- (void)stopNetworkSpeedMonitor;


@end

NS_ASSUME_NONNULL_END
