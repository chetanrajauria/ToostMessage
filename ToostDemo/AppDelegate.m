//
//  AppDelegate.m
//  ToostDemo
//
//  Created by Yashwant Kumar on 19/12/17.
//  Copyright © 2017 Yashwant. All rights reserved.
//

#import "AppDelegate.h"

#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
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


-(void) showToastMessage:(NSString *) message
{
    
    //if there is already a toast message on the screen so that donot show and return from here only
    if ([self.window.rootViewController.view viewWithTag:100])
    {
        return;
    }
    
    UILabel *lblMessage = [[UILabel alloc]init];
    lblMessage.tag = 100;
    lblMessage.textAlignment = NSTextAlignmentCenter;
    lblMessage.text = message;
    lblMessage.font = [UIFont systemFontOfSize:12.0];
    lblMessage.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    lblMessage.textColor = [UIColor whiteColor];
    
    CGSize textSize = [[lblMessage text] sizeWithAttributes:@{NSFontAttributeName:[lblMessage font]}];
    
    float x = self.window.rootViewController.view.center.x - textSize.width/2;
    float labelWidth = MIN(textSize.width, SCREEN_WIDTH - 40);
    
    lblMessage.frame = CGRectMake(x, SCREEN_HEIGHT - 90.f, labelWidth + 50, textSize.height + 20);
    CGRect oldFrame = lblMessage.frame;
    
    //comment this line if u don't want to show the toost message below in the screen
    lblMessage.center = self.window.rootViewController.view.center;
    x = lblMessage.frame.origin.x;
    lblMessage.frame = CGRectMake(x, oldFrame.origin.y, oldFrame.size.width, oldFrame.size.height);
    
    //and add this line if you want to show the message in the centre of the screen
    //lblMessage.center = self.window.rootViewController.view.center;
    
    lblMessage.layer.cornerRadius = lblMessage.frame.size.height/2;
    lblMessage.layer.masksToBounds = true;
    
    [self.window.rootViewController.view addSubview:lblMessage];
    [self performSelector:@selector(removeToastMessage:) withObject:lblMessage afterDelay:2.0f];
    
}


-(void) removeToastMessage: (UILabel *)label
{
    [UIView animateWithDuration:1.0f animations:^{
        label.alpha = 0.f;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [label removeFromSuperview];
        
    });
}

@end
