# LXLocalizationLanguage

### Use code to change the application text language.<br>
![localizationsLanguage.gif](localizationsLanguage.gif)<br>

### Integration step<br>
1. Create your ‘Localizable.strings’ file and create your strings in different languages.<br><br>
2. Define macro

```
#define Localized(key)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"Localizable"]
And use this macro to define your string.
```

3. Implement function<br>

```
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
```

4. Implement function<br>
```
- (void)refresh:(UIViewController *)viewController;
```
In AppDelegate to force refresh related ViewController.
