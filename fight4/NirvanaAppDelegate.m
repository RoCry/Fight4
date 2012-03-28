//
//  NirvanaAppDelegate.m
//  fight4
//
//  Created by  on 2012/3/26.
//  Copyright (c) 2012 7782. All rights reserved.
//

#import "NirvanaAppDelegate.h"

@implementation NirvanaAppDelegate

@synthesize window = _window;

-(NSString *)appKey{ 
    return @"4f7177e45270153890000064"; 
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    [MobClick setDelegate:self reportPolicy:BATCH];
    return YES;
}

@end
