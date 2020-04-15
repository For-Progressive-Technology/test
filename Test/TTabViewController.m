//
//  TTabViewController.m
//  Test
//
//  Created by Effort on 2019/10/18.
//  Copyright © 2019 Effort. All rights reserved.
//

#import "TTabViewController.h"
#import "TViewController.h"
@interface TTabViewController ()

@end

@implementation TTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildVC];
}

- (void)addChildVC {
    TViewController *vc = [[TViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:vc];
    
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:vc1];
}

@end
