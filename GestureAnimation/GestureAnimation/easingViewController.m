//
//  easingViewController.m
//  GestureAnimation
//
//  Created by Ben Langholz on 2/26/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//
//NOTES
//-Have to find a better way to do this switch so it can toggle mid animation


#import "easingViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface easingViewController ()
@property (strong, nonatomic) IBOutlet UILabel *testLabel;
@property (strong, nonatomic) IBOutlet UIView *redSquare;
@property (strong, nonatomic) IBOutlet UIView *blueSquare;
@property (strong, nonatomic) IBOutlet UIView *greenSquare;
@property (strong, nonatomic) IBOutlet UIView *yellowSquare;
@property (nonatomic, assign) BOOL isForward;
@property (nonatomic, assign) CGRect startFrameRed;
@property (nonatomic, assign) CGRect startFrameBlue;
@property (nonatomic, assign) CGRect startFrameGreen;
@property (nonatomic, assign) CGRect startFrameYellow;


@end

@implementation easingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Easing";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat spacing = 60;

    self.redSquare = [[UIView alloc] initWithFrame:CGRectMake(20, 90, 50, 50)];
    self.redSquare.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redSquare];

    self.blueSquare = [[UIView alloc] initWithFrame:CGRectMake(20, 90+spacing, 50, 50)];
    self.blueSquare.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueSquare];
    
    self.greenSquare = [[UIView alloc] initWithFrame:CGRectMake(20, 90+spacing*2, 50, 50)];
    self.greenSquare.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenSquare];
    
    self.yellowSquare = [[UIView alloc] initWithFrame:CGRectMake(20, 90+spacing*3, 50, 50)];
    self.yellowSquare.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.yellowSquare];
    
    UIButton *animateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [animateButton addTarget:self action:@selector(animateButtonUp:) forControlEvents:UIControlEventTouchUpInside];
    animateButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    [animateButton setTitle:@"Animate!" forState:UIControlStateNormal];
    NSLog(@"Frame: %@", NSStringFromCGRect(animateButton.frame));
    [animateButton sizeToFit];
    float width = animateButton.frame.size.width + 50;
    animateButton.frame = CGRectMake(320/2-width/2, 1136/2-120, width, animateButton.frame.size.height+10);
    animateButton.backgroundColor = UIColorFromRGB(0xececec);
    [self.view addSubview:animateButton];
    
    
    
    self.startFrameRed = self.redSquare.frame;
    self.startFrameBlue = self.blueSquare.frame;
    self.startFrameGreen = self.greenSquare.frame;
    self.startFrameYellow = self.yellowSquare.frame;
    self.isForward = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)animateButtonUp:(id)sender {
    NSLog(@"Animate button Tapped!");
    
    float duration = 1;
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect endFrame;
        if (self.isForward) {
            endFrame = self.redSquare.frame;
            endFrame.origin = CGPointMake(endFrame.origin.x+230, endFrame.origin.y);
        } else {
            endFrame = self.startFrameRed;
        }
        self.redSquare.frame = endFrame;
    } completion:nil];

//    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//        CGRect endFrame = self.redSquare.frame;
//        endFrame.origin = CGPointMake(endFrame.origin.x+230, endFrame.origin.y);
//        self.redSquare.frame = endFrame;
//    } completion:nil];

    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect endFrame;
        if (self.isForward) {
            endFrame = self.blueSquare.frame;
            endFrame.origin = CGPointMake(endFrame.origin.x+230, endFrame.origin.y);
        } else {
            endFrame = self.startFrameBlue;
        }
        self.blueSquare.frame = endFrame;
    } completion:nil];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect endFrame;
        if (self.isForward) {
            endFrame = self.greenSquare.frame;
            endFrame.origin = CGPointMake(endFrame.origin.x+230, endFrame.origin.y);
        } else {
            endFrame = self.startFrameGreen;
        }
        self.greenSquare.frame = endFrame;
    } completion:nil];
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:.8 initialSpringVelocity:10 options:0 animations:^{
        CGRect endFrame;
        if (self.isForward) {
            endFrame = self.yellowSquare.frame;
            endFrame.origin = CGPointMake(endFrame.origin.x+230, endFrame.origin.y);
        } else {
            endFrame = self.startFrameYellow;
        }
        self.yellowSquare.frame = endFrame;
    } completion:nil];

    self.isForward = !self.isForward;
}

@end
