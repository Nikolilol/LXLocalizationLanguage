//
//  ViewController.m
//  LXLocalizationsLanguage
//
//  Created by Niko on 16/5/6.
//  Copyright © 2016年 niko. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

/** 代码切换语言 **/
#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Localizable"]

@interface ViewController ()
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self languageWithSystem];
    
    [self languageWithButton];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 250, 150, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:Localized(@"Change Button") forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(changeLanguage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)languageWithSystem
{
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    testLabel.text = NSLocalizedString(@"Hello World", @"this String will change with system language!");
    [self.view addSubview:testLabel];
}

- (void)changeLanguage:(id)sender
{
    NSString *language = [[NSUserDefaults standardUserDefaults]objectForKey:@"appLanguage"];
    if ([language isEqualToString: @"en"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
    }else {
        [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];

    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;

    [delegate toMain];
}


- (void)languageWithButton
{
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 350, 100, 100)];
    testLabel.text = Localized(@"Hello World");
    [self.view addSubview:testLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
