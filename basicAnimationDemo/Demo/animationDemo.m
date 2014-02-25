//
//  animationDemo.m
//  Demo
//
//  Created by Ben Langholz on 2/25/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "animationDemo.h"

@interface animationDemo ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
- (IBAction)onGoButton:(id)sender;

@end

@implementation animationDemo

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onGoButton:(id)sender {
    
    [UIView animateWithDuration:2 animations:^{
        
        CGRect endFrame = self.blueView.frame;
        endFrame.origin = CGPointMake(endFrame.origin.x +40, endFrame.origin.y);
        endFrame.size = CGSizeMake(endFrame.size.width /2, endFrame.size.height /2);
        self.blueView.frame = endFrame;
        
        self.blueView.backgroundColor = [UIColor redColor];
        self.blueView.alpha = self.blueView.alpha /2;
        
    }];
    
//    [UIView animateWithDuration:5 animations:^{
//        self.blueView.alpha = 0;
//    } completion:^(BOOL finished) {
//        [[UIAlertView alloc] initWithTitle:@"gone" message:@"The square is gone" delegate:nil cancelButtonTitle:[@"Ok" otherButtonTitles:nil] show];
//    }];
    
}
@end
