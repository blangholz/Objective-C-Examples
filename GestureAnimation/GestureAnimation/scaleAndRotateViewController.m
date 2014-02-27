//
//  scaleAndRotateViewController.m
//  GestureAnimation
//
//  Created by Ben Langholz on 2/26/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "scaleAndRotateViewController.h"

@interface scaleAndRotateViewController ()

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
