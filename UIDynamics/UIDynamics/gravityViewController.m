//
//  gravityViewController.m
//  UIDynamics
//
//  Created by Ben Langholz on 3/11/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "gravityViewController.h"

@interface gravityViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) UIView *blueView;

@end

@implementation gravityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Gravity";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.gravityBehavior = [[UIGravityBehavior alloc] init];
    [self.animator addBehavior:self.gravityBehavior];
    
    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    [self.gravityBehavior addItem:self.blueView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
