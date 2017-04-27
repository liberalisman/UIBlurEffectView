//
//  ViewController.m
//  blur
//
//  Created by 耿志强 on 2017/4/27.
//  Copyright © 2017年 耿志强. All rights reserved.
//

#import "ViewController.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // backGroundView
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    
    // backgroundImage
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = view.bounds;
    [view addSubview:imageView];
    
    NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493272221853&di=50ab9f5bb3f4431f103446413a5e0e0c&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201606%2F08%2F20160608203349_SW5nk.thumb.700_0.jpeg"];
    
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    imageView.image = [UIImage imageWithData:imageData];
    
    
    // BlurEffect
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:effect];
    blurView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:blurView];
    
    
    // vibranceView
    UIVisualEffectView *vibranceView = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:effect]];
    vibranceView.frame = blurView.bounds;
    [blurView.contentView addSubview:vibranceView];
    
    // UILable
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2 - 70, SCREEN_WIDTH, 140)];
    label.text = @"Vibrance  View";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:40.0f];
    [vibranceView.contentView addSubview:label];
 
}

@end
