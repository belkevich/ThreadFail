//
//  MyThread.m
//  ThreadFail
//
//  Created by Alexey Belkevich on 28.09.15.
//  Copyright © 2015 okolodev. All rights reserved.
//

#import "MyThread.h"

@implementation MyThread

- (void)dealloc
{
    [self cancel];
}

#pragma mark - public

- (void)dispatchAsync:(void (^)())block
{
    [self performSelector:@selector(performBlock:) onThread:self withObject:block waitUntilDone:NO];
}

#pragma mark - override

- (void)main
{
    NSLog(@"I'm entered");
    @autoreleasepool
    {
        while (!self.cancelled)
        {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:NSDate.distantFuture];
        }
    }
    NSLog(@"I'm quit");
}

#pragma mark - private

- (void)performBlock:(void (^)())block
{
    block();
}

@end
