//
//  MyThread.h
//  ThreadFail
//
//  Created by Alexey Belkevich on 28.09.15.
//  Copyright © 2015 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyThread : NSThread

- (void)dispatchAsync:(void (^)())block;

@end
