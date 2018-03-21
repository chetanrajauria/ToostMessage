//
//  ViewController.m
//  ToostDemo
//
//  Created by Yashwant Kumar on 19/12/17.
//  Copyright © 2017 Yashwant. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)myButton:(id)sender {
    
    AppDelegate *appDel = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSString *strMessage = @"Hello yash is the best";
    [appDel showToastMessage:strMessage];
}



@end
