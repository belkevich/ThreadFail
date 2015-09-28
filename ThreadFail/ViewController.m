//
//  ViewController.m
//  ThreadFail
//
//  Created by Alexey Belkevich on 28.09.15.
//  Copyright © 2015 okolodev. All rights reserved.
//

#import "ViewController.h"
#import "MyThread.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController

- (IBAction)buttonPressed:(id)sender {
    MyThread *thread = [[MyThread alloc] init];
    [thread start];
    [thread dispatchAsync:^{
        [thread cancel];
    }];
    [self.button setTitle:@"Start thread second time (FAIL)" forState:UIControlStateNormal];
}

@end
