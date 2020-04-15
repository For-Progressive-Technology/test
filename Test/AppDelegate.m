//
//  AppDelegate.m
//  Test
//
//  Created by Effort on 2019/10/18.
//  Copyright © 2019 Effort. All rights reserved.
//

#import "AppDelegate.h"
#import <JPUSHService.h>
//#ifdef DEBUG
//#import <DoraemonKit/DoraemonKit.h>
//#endif
#import <UMCommon/UMCommon.h>
#import <UMAnalytics/MobClick.h>
#import <TestFramework/TestFramework.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[TestMethod new] printContent];
    // Override point for customization after application launch.'
//    #ifdef DEBUG
//        [[DoraemonManager shareInstance] install];
//    #endif
    
    //Required
    //notice: 3.0.0 及以后版本注册可以这样写，也可以继续用之前的注册方式
//    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
//    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
//      // 可以添加自定义 categories
//      // NSSet<UNNotificationCategory *> *categories for iOS10 or later
//      // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
//    }
//    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
//    [JPUSHService setupWithOption:launchOptions appKey:@"bc8923b439e31f390d53cb9a" channel:@"App Store" apsForProduction:0];
//    BOOL canNext = false;
//    NSString *value2 =nil;
//    NSMutableDictionary *dict = @{@"123": @"!@3"}.mutableCopy;
//    dict[@"123"] = value2;
    
    [UMConfigure initWithAppkey:@"" channel:@""];
    [MobClick setScenarioType:E_UM_NORMAL];
    return YES;
}

- (void)test {
    NSLog(@"test");
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [JPUSHService registerDeviceToken:deviceToken];
    
    [JPUSHService setAlias:@"123" completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        NSLog(@"%zd",iResCode);
    } seq:0];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  //Optional
  NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

//// iOS 12 Support
//- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
//  if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//    //从通知界面直接进入应用
//  }else{
//    //从通知设置界面进入应用
//  }
//}
//
//// iOS 10 Support
//- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
//  // Required
//  NSDictionary * userInfo = notification.request.content.userInfo;
//  if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//    [JPUSHService handleRemoteNotification:userInfo];
//  }
//  completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
//}
//
//// iOS 10 Support
//- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
//  // Required
//  NSDictionary * userInfo = response.notification.request.content.userInfo;
//  if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//    [JPUSHService handleRemoteNotification:userInfo];
//  }
//  completionHandler();  // 系统要求执行这个方法
//}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
