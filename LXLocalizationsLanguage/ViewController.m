//
//  ViewController.m
//  LXLocalizationsLanguage
//
//  Created by Niko on 16/5/6.
//  Copyright © 2016年 niko. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

/** macro pre-define **/
#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Localizable"]

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    // current language label
    UILabel *clLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, width, 100)];
    clLabel.text = [NSString stringWithFormat:@"Current language: %@", Localized(@"Current Language")];
    clLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:clLabel];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake((width - 150) * 0.5, 200, 150, 50);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:Localized(@"Change Button") forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(changeLanguage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    // text label
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 350, width, 100)];
    textLabel.text = Localized(@"Hello World");
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLabel];
}

- (void)changeLanguage:(id)sender{
    // get current app language
    NSString *language = [[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"];
    
    // switch language between 'en' and 'zh-Hans'
    if ([language isEqualToString: @"en"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
    }else {
        [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];

    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    // refreash windows.
    ViewController *vc = [[ViewController alloc] init];
    [delegate refresh:vc];
}
@end













































