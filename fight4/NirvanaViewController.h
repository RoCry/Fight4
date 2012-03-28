//
//  NirvanaViewController.h
//  fight4
//
//  Created by  on 2012/3/26.
//  Copyright (c) 2012 7782. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NirvanaNoticationUtils.h"
#import <QuartzCore/QuartzCore.h>

@interface NirvanaViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *defaultTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (strong, nonatomic) CATransition *defaultAnimation;
@property (strong, nonatomic) NSDate *defaultDate;
@property (nonatomic) BOOL animationOn;
@property (nonatomic) BOOL stop;

@property (weak, nonatomic) IBOutlet UILabel *s1;
@property (weak, nonatomic) IBOutlet UILabel *s0;

@property (weak, nonatomic) IBOutlet UILabel *m0;
@property (weak, nonatomic) IBOutlet UILabel *m1;

@property (weak, nonatomic) IBOutlet UILabel *h0;
@property (weak, nonatomic) IBOutlet UILabel *h1;

@property (weak, nonatomic) IBOutlet UILabel *d0;
@property (weak, nonatomic) IBOutlet UILabel *d1;
@property (weak, nonatomic) IBOutlet UILabel *d2;

@property (weak, nonatomic) IBOutlet UIView *fightView;
@property (weak, nonatomic) IBOutlet UIView *timeView;
@property (weak, nonatomic) IBOutlet UILabel *fightLabel;
@property (weak, nonatomic) IBOutlet UILabel *colonLabel;
@property (weak, nonatomic) IBOutlet UILabel *colonLabel2;

- (IBAction)tap:(UITapGestureRecognizer *)sender;

@end
