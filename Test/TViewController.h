//
//  TViewController.h
//  Test
//
//  Created by Effort on 2019/10/18.
//  Copyright © 2019 Effort. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PhoneInfoDelegate <NSObject>

- (NSString *)name;

@end
NS_ASSUME_NONNULL_BEGIN

@interface TViewController : UIViewController

@property (nonatomic, strong) id<PhoneInfoDelegate> phoneInfo;

@end

NS_ASSUME_NONNULL_END
