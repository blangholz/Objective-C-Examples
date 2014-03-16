//
//  attachmentViewController.m
//  UIDynamics
//
//  Created by Ben Langholz on 3/11/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "attachmentViewController.h"

@interface attachmentViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;
@property (nonatomic, strong) UIView *panPoint;
@property (nonatomic, strong) UIView *blueView;

- (void)onPanGestureRecgonizer:(UIPanGestureRecognizer *)panGestureRecognizer;

@end

@implementation attachmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Attachent";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];


    
    self.panPoint = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 10, 10)];
    self.panPoint.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.panPoint];
    
    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    [self.blueView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGestureRecgonizer:)]];
    
    self.gravityBehavior = [[UIGravityBehavior alloc] init];
    [self.animator addBehavior:self.gravityBehavior];
    
    self.attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.blueView attachedToAnchor:CGPointMake(10, 200)];
    [self.animator addBehavior:self.attachmentBehavior];
    //    self.attachmentBehavior.anchorPoint =

    
//    [self.gravityBehavior addItem:self.blueView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onPanGestureRecgonizer:(UIPanGestureRecognizer *)panGestureRecognizer {
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [panGestureRecognizer locationInView:self.view];
        CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
        NSLog(@"Gesture began at: %@", NSStringFromCGPoint(point));
        
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [panGestureRecognizer locationInView:self.view];
        CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
        NSLog(@"%@", NSStringFromCGPoint(point));
        
        self.panPoint.center = point;

    } else if (panGestureRecognizer.state ==  UIGestureRecognizerStateEnded) {
        CGPoint point = [panGestureRecognizer locationInView:self.view];
        CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
        NSLog(@"Gesture ended: %@", NSStringFromCGPoint(point));
        
    }
}
@end
