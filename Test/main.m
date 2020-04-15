//
//  main.m
//  Test
//
//  Created by Effort on 2019/10/18.
//  Copyright © 2019 Effort. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

struct NSOjbect_IMPL {
    Class isa;
};


int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        
        NSObject *ojbect = [[NSObject alloc] init];
        
        
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
