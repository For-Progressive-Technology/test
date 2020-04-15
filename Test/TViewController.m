//
//  TViewController.m
//  Test
//
//  Created by Effort on 2019/10/18.
//  Copyright © 2019 Effort. All rights reserved.
//

//#import "TViewController.h"
//#import <MediaPlayer/MediaPlayer.h>
//@interface TViewController ()
//
//@end
//
//@implementation TViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//
////    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(120, 0, 30, 30)];
////    btn.backgroundColor = [UIColor redColor];
////    [self.view addSubview:btn];
////    [btn addTarget:self action:@selector(changeFrame:) forControlEvents:UIControlEventTouchUpInside];
//
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://crm.goboosoft.com/mcrm/index.html#/index?type=test"]]];
//    [self.view addSubview:webView];
//
//
//}
//
//
//- (void)changeFrame:(UIButton *)btn {
////    [UIView animateWithDuration:0.5 animations:^{
////        btn.frame = CGRectMake(0, 0, 150, 30);
////    }];
//    MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:@"http://taskcertdev.oss-cn-shanghai.aliyuncs.com/607/503607/166_503607_Q1521527361648_1_first_normal_dur70_1572157942565_FBF0FEEA.mp3"]];
//    [vc.moviePlayer prepareToPlay];
//    vc.moviePlayer.shouldAutoplay = YES;
//    vc.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
//    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//
//    [self presentViewController:vc animated:YES completion:nil];
//
//}
//
////- (BOOL)prefersStatusBarHidden {
////    return YES;
////}
//
//@end

#import "TViewController.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
#import "NetworkSpeedMonitor.h"

@interface TViewController ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NetworkSpeedMonitor *speedMonitor;

@end

@implementation TViewController
- (void)viewDidLoad {
    [super viewDidLoad];
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getInternetface) userInfo:nil repeats:YES];
//    [timer fireDate];
//    self.speedMonitor = [[NetworkSpeedMonitor alloc] init];
//    [self.speedMonitor startNetworkSpeedMonitor];//开始监听网速
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkSpeedChanged:) name:NetworkUploadSpeedNotificationKey object:nil];
    self.view.backgroundColor = [UIColor whiteColor];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    tableView.dataSource = self;
////    tableView.layer.opacity = 0.5;
//    [self.view addSubview:tableView];
//    self.tableView = tableView;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 88, 80, 80)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageView.userInteractionEnabled = true;
    imageView.image = [UIImage imageNamed:@"WechatIMG5"];
    [self.view addSubview:imageView];
}

- (void)test {
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:200 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:true];
    
    NSLog(@"123123");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 400;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [@(indexPath.row) stringValue];
    return cell;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.speedMonitor stopNetworkSpeedMonitor];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NetworkUploadSpeedNotificationKey object:nil];
}

- (void)networkSpeedChanged:(NSNotification *)sender {
    NSString *downloadSpped = [sender.userInfo objectForKey:NetworkSpeedNotificationKey];
//    self.networkSpeedLabel.text = downloadSpped;
    NSLog(@"%@",downloadSpped);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"123" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//
//    [alert addAction:[UIAlertAction actionWithTitle:@"123" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        picker.modalPresentationStyle = UIModalPresentationOverFullScreen;
//        [self presentViewController:picker animated:true completion:nil];
//    }]];
//
//    [self presentViewController:alert animated:true completion:nil];
//
//    UITextField *t;
//
//}
//
//- (void)getInternetface {
//    long long hehe = [self getInterfaceBytes];
//    NSLog(@"hehe:%lld",hehe);
//}
///*获取网络流量信息*/
//- (long long) getInterfaceBytes
//{
//    struct ifaddrs *ifa_list = 0, *ifa;
//    if (getifaddrs(&ifa_list) == -1)
//    {
//        return 0;
//    }
//    uint32_t iBytes = 0;
//    uint32_t oBytes = 0;
//    for (ifa = ifa_list; ifa; ifa = ifa->ifa_next)
//    {
//        if (AF_LINK != ifa->ifa_addr->sa_family)
//           continue;
//        if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
//            continue;
//        if (ifa->ifa_data == 0)
//            continue;
//  /* Not a loopback device. */
//       if (strncmp(ifa->ifa_name, "lo", 2))
//        {
//            struct if_data *if_data = (struct if_data *)ifa->ifa_data;
//            iBytes += if_data->ifi_ibytes;
//            oBytes += if_data->ifi_obytes;
//        }
//    }
//    freeifaddrs(ifa_list);
//    NSLog(@"\n[getInterfaceBytes-Total]%d,%d",iBytes,oBytes);
//    return iBytes + oBytes;
//}

@end
