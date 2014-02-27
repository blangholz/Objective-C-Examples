//
//  scaleAndRotateViewController.m
//  GestureAnimation
//
//  Created by Ben Langholz on 2/26/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "scaleAndRotateViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface scaleAndRotateViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *likeButton;

@end

@implementation scaleAndRotateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Scale and Rotate";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *likeThumb = [UIImage imageNamed:@"likeThumb"];
    UIImageView *likeButton = [[UIImageView alloc] initWithImage:likeThumb];
    likeButton.backgroundColor = [UIColor blackColor];
    [likeButton setFrame:CGRectMake(100, 200, 0, 0)];
    [likeButton sizeToFit];
    likeButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:likeButton];
    
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
    
    CGAffineTransform transform = CGAffineTransformMakeScale(0,0);
    self.likeButton.transform = transform;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)animateButtonUp:(id)sender {
    NSLog(@"Animate button Tapped!");
    CGAffineTransform transform = CGAffineTransformMakeScale(0,0);
    self.likeButton.transform = transform;
    
    [UIView animateWithDuration:1 animations:^{
        CGAffineTransform transform = CGAffineTransformMakeScale(1,1);
        self.likeButton.transform = transform;
    } completion:nil];
}

@end
