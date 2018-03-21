//
//  AppDelegate.h
//  ToostDemo
//
//  Created by Yashwant Kumar on 19/12/17.
//  Copyright © 2017 Yashwant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(void) showToastMessage:(NSString *) message;

@end

