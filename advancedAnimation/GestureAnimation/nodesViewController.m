//
//  nodesViewController.m
//  advancedAnimation
//
//  Created by Ben Langholz on 2/27/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "nodesViewController.h"

@interface nodesViewController ()
@property (strong, nonatomic) IBOutlet UIView *redSquare;

- (void)onCustomTap:(UITapGestureRecognizer *)tapGestureRecognizer;
- (void)onLongPress:(UITapGestureRecognizer *)longPressGestureRecognizer;


@end

@implementation nodesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Nodes!";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    UITapGestureRecognizer *singelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onCustomTap:)];
    
    [self.view addGestureRecognizer:singelTapGestureRecognizer];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onCustomTap:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSLog(@"TAP!");
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    
    self.redSquare = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.redSquare.center = point;
    self.redSquare.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redSquare];
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress:)];
    
    [self.view addGestureRecognizer:longPressGestureRecognizer];
    
}

- (void)onLongPress:(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    NSLog(@"Pressed!");
//    UIView *view = [self.view hitTest:touch withEvent:nil];

}


@end
