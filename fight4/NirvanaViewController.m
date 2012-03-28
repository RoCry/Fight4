//
//  NirvanaViewController.m
//  fight4
//
//  Created by  on 2012/3/26.
//  Copyright (c) 2012 7782. All rights reserved.
//

#import "NirvanaViewController.h"


@interface NirvanaViewController ()
- (void)updateTimeLabel;
- (void)displayAnimation:(CATransition *)animation 
                    label:(UILabel *)label 
                    text:(NSString *)text;
- (void)toggleRefresh:(BOOL)reverse;
@end

@implementation NirvanaViewController
@synthesize animationOn;
@synthesize stop;
@synthesize defaultTimeLabel;
@synthesize testLabel;
@synthesize defaultAnimation = _defaultAnimation;
@synthesize defaultDate = _defaultDate;
@synthesize s1;
@synthesize s0;
@synthesize m0;
@synthesize m1;
@synthesize h0;
@synthesize h1;
@synthesize d0;
@synthesize d1;
@synthesize d2;
@synthesize timeView;
@synthesize fightLabel;
@synthesize colonLabel;
@synthesize colonLabel2;
@synthesize fightView;

- (CATransition *)defaultAnimation{
    if (!_defaultAnimation) {
        _defaultAnimation  = [CATransition animation];
        _defaultAnimation.delegate = self;
        _defaultAnimation.duration = 0.2;
        _defaultAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        _defaultAnimation.type = kCATransitionPush;
        _defaultAnimation.subtype = kCATransitionFromBottom;
    }
    return _defaultAnimation;
}

- (NSDate *)defaultDate{
    if (!_defaultDate) {
        _defaultDate = [[NSUserDefaults standardUserDefaults]objectForKey:@"DefaultDate"];
    }
    return _defaultDate;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [NirvanaNoticationUtils scheduleNotification];
    animationOn = YES;
    stop = [[[NSUserDefaults standardUserDefaults]objectForKey:@"kStopRefresh"]boolValue];
    [self toggleRefresh:stop];
}

- (void)viewDidUnload
{
    [self setDefaultTimeLabel:nil];
    [self setTestLabel:nil];
    [self setS1:nil];
    [self setS0:nil];
    [self setM0:nil];
    [self setM1:nil];
    [self setH0:nil];
    [self setH1:nil];
    [self setD0:nil];
    [self setD1:nil];
    [self setD2:nil];
    [self setTimeView:nil];
    [self setFightView:nil];
    [self setFightLabel:nil];
    [self setColonLabel:nil];
    [self setColonLabel2:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)updateTimeLabel{
    NSInteger offset = [[NSDate date] timeIntervalSinceDate:self.defaultDate];
    
    int day2,day1,day0,hour1,hour0,min1,min0,sec1,sec0;
    int day,hour,min,sec;
    
    day = offset / 86400;
    hour = offset / 3600 % 24;
    min = offset / 60 % 60;
    sec = offset % 60;
    
    day2 = day / 100;
    day1 = day % 100 / 10;
    day0 = day % 10;
    
    hour1 = hour / 10;
    hour0 = hour % 10;
    
    min1 = min / 10;
    min0 = min % 10;
    
    sec1 = sec / 10;
    sec0 = sec % 10;
    
    if (sec1 != [self.s1.text intValue]) {
        [self displayAnimation:self.defaultAnimation 
                         label:self.s1 
                          text:[NSString stringWithFormat:@"%d",sec1]];
    }
    if (sec0 != [self.s0.text intValue]) {
        [self displayAnimation:self.defaultAnimation 
                         label:self.s0 
                          text:[NSString stringWithFormat:@"%d",sec0]];
    }
    if (min1 != [self.m1.text intValue]) {
        [self displayAnimation:self.defaultAnimation 
                         label:self.m1 
                          text:[NSString stringWithFormat:@"%d",min1]];
    }
    if (min0 != [self.m0.text intValue]) {
        [self displayAnimation:self.defaultAnimation 
                         label:self.m0 
                          text:[NSString stringWithFormat:@"%d",min0]];
    }
    if (hour1 != [self.h1.text intValue]) {
        [self displayAnimation:self.defaultAnimation 
                         label:self.h1 
                          text:[NSString stringWithFormat:@"%d",hour1]];
    }
    if (hour0 != [self.h0.text intValue]) {
        [self displayAnimation:self.defaultAnimation 
                         label:self.h0 
                          text:[NSString stringWithFormat:@"%d",hour0]];
    }
    if (day2 != [self.d2.text intValue]) {
        if ([self.d2 isHidden]) {
            [self.d2 setHidden:NO];
        }
        [self displayAnimation:self.defaultAnimation 
                         label:self.d2 
                          text:[NSString stringWithFormat:@"%d",day2]];
    }
    if (day1 != [self.d1.text intValue]) {
        if ([self.d1 isHidden]) {
            [self.d1 setHidden:NO];
        }
        [self displayAnimation:self.defaultAnimation 
                         label:self.d1 
                          text:[NSString stringWithFormat:@"%d",day1]];
    }
    if (day0 != [self.d0.text intValue]) {
        if ([self.d0 isHidden]) {
            [self.d0 setHidden:NO];
        }
        [self displayAnimation:self.defaultAnimation 
                         label:self.d0 
                          text:[NSString stringWithFormat:@"%d",day0]];
    }
    if (!stop) {
        [self performSelector:@selector(updateTimeLabel) withObject:nil afterDelay:1.0f];
    }
}

- (void)displayAnimation:(CATransition *)animation 
                    label:(UILabel *)label 
                    text:(NSString *)text {

    [label setText:text];
    if (animationOn) {
        [[label layer] addAnimation:animation forKey:@"animation"];
    }
}

- (void)toggleRefresh:(BOOL)reverse{
    UIColor *color1;
    UIColor *color2;
    stop = reverse;
    if (reverse) {
        color1 = [UIColor whiteColor];
        color2 = [UIColor blackColor];
    }else {
        color1 = [UIColor blackColor];
        color2 = [UIColor whiteColor];
    }
    CATransition *animation = [self.defaultAnimation copy];
    animation.type = kCATransitionFade;
    animation.duration = 0.7;
    
    [self.fightView setBackgroundColor:color1];
    [self.timeView setBackgroundColor:color2];
    
    [self.fightLabel setTextColor:color2];
    [self.d0 setTextColor:color1];
    [self.d1 setTextColor:color1];
    [self.d2 setTextColor:color1];
    [self.h0 setTextColor:color1];
    [self.h1 setTextColor:color1];
    [self.m0 setTextColor:color1];
    [self.m1 setTextColor:color1];
    [self.s0 setTextColor:color1];
    [self.s1 setTextColor:color1]; 
    [self.colonLabel setTextColor:color1];
    [self.colonLabel2 setTextColor:color1];
    [[self.view layer] addAnimation:animation forKey:@"animation"];
    
    [[NSUserDefaults standardUserDefaults]setValue:[NSNumber numberWithBool:stop] forKey:@"kStopRefresh"];
    [self updateTimeLabel];
}

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    [self toggleRefresh:!stop];
}
@end
