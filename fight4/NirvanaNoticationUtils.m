//
//  NirvanaNoticationUtils.m
//  fight4
//
//  Created by  on 2012/3/26.
//  Copyright (c) 2012 7782. All rights reserved.
//

#import "NirvanaNoticationUtils.h"

@implementation NirvanaNoticationUtils

+ (void)test{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    
    for (int i = 0; i < 60; i++) {
        localNotif.fireDate = [[NSDate date] dateByAddingTimeInterval:i*2];
        localNotif.timeZone = [NSTimeZone defaultTimeZone];
        [localNotif setApplicationIconBadgeNumber:i];
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
        NSLog(@"the %d notification is scheduled",i);
    }

}

+ (void)scheduleNotification {
    if (NO) {
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        
        //The Z at the end of your string represents Zulu which is UTC
        [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
        
        NSDate* successDate = [dateFormatter dateFromString:@"2012-06-10T08:16:00Z"];
        
        [[NSUserDefaults standardUserDefaults]setValue:successDate forKey:@"DefaultDate"];
    }
    NSDate *theDefaultDate = [[NSUserDefaults standardUserDefaults]objectForKey:@"DefaultDate"];
    if (!theDefaultDate) {
        theDefaultDate = [NSDate date];
        [[NSUserDefaults standardUserDefaults]setValue:theDefaultDate forKey:@"DefaultDate"];
    }
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    
    NSInteger offset = [[NSDate date] timeIntervalSinceDate:theDefaultDate];
    int deltaDay = offset / 86400;

    for (int i = deltaDay; i < deltaDay + 60; i++) {
        if (offset < 0 && i <= 0) {
            localNotif.fireDate = [theDefaultDate dateByAddingTimeInterval:(i-1)*86400];
        }else {
            localNotif.fireDate = [theDefaultDate dateByAddingTimeInterval:i*86400];
        }
        localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
        [localNotif setApplicationIconBadgeNumber:ABS(i)];
      
            
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    }
    
}


@end
