//
//  AppDelegate.m
//  IntroductionViewController
//
//  Created by 惠上科技 on 2018/12/14.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import "AppDelegate.h"
#import "IntroductionView.h"
#import "ViewController.h"
@interface AppDelegate ()

@property (nonatomic, strong) IntroductionView *introductionView;
@property (nonatomic, strong) NSArray *coverImageNames;
@property (nonatomic, strong) NSArray *backgroundImageNames;
@property (nonatomic, strong) NSArray *coverTitles;
@property (nonatomic, strong) NSURL *videoURL;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UIViewController *vc = [[UIViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    self.coverImageNames = @[@"img_index_01txt", @"img_index_02txt", @"img_index_03txt"];
    self.backgroundImageNames = @[@"img_index_01bg", @"img_index_02bg", @"img_index_03bg"];
    self.coverTitles = @[@"MAKE THE WORLD", @"THE BETTER PLACE"];
    
    // data source
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"intro_video" ofType:@"mp4"];
    self.videoURL = [NSURL fileURLWithPath:filePath];
    
    // Added Introduction View
//    self.introductionView = [self simpleIntroductionView];
//    self.introductionView = [self coverImagesIntroductionView];
//    self.introductionView = [self customButtonIntroductionView];
    self.introductionView = [self videoIntroductionView];
//    self.introductionView = [self advanceIntroductionView];
    [self.window addSubview:self.introductionView];
    __weak AppDelegate *weakSelf = self;
    self.introductionView.didSelectedEnter = ^{
        [weakSelf.introductionView removeFromSuperview];
        weakSelf.introductionView = nil;
        ViewController *vc = [[ViewController alloc] init];
        weakSelf.window.rootViewController = vc;
    };
    return YES;
}


-(IntroductionView *)simpleIntroductionView{
    IntroductionView *vc = [[IntroductionView alloc] initWithCoverImageNames:self.backgroundImageNames];
    return vc;
}

- (IntroductionView *)coverImagesIntroductionView{
    IntroductionView *vc = [[IntroductionView alloc] initWithCoverImageNames:self.coverImageNames backgroundImageNames:self.backgroundImageNames];
    return vc;
}

- (IntroductionView *)customButtonIntroductionView{
    UIButton *enterButton = [UIButton new];
    [enterButton setBackgroundImage:[UIImage imageNamed:@"bg_bar"] forState:UIControlStateNormal];
    [enterButton setTitle:@"Login" forState:UIControlStateNormal];
    IntroductionView *vc = [[IntroductionView alloc] initWithCoverImageNames:self.coverImageNames backgroundImageNames:self.backgroundImageNames button:enterButton];
    return vc;
}

- (IntroductionView *)videoIntroductionView{
    IntroductionView *vc = [[IntroductionView alloc] initWithVideo:self.videoURL volume:0.7];
    vc.coverImageNames = self.coverImageNames;
    return vc;
}

- (IntroductionView *)advanceIntroductionView{
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(3, self.window.frame.size.height - 60, self.window.frame.size.width - 6, 50)];
    loginButton.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    IntroductionView *vc = [[IntroductionView alloc] initWithVideo:self.videoURL volume:0.7];
    vc.coverImageNames = self.coverImageNames;
    vc.hiddenEnterButton = YES;
    vc.pageControllOffset = CGPointMake(0, -100);
    vc.labelAttributes = @{NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldMT" size:28.0],NSForegroundColorAttributeName:[UIColor whiteColor]};
    vc.coverView = loginButton;
    vc.coverTitles = self.coverTitles;
    return vc;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
