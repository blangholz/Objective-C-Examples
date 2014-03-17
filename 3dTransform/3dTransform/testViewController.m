//
//  testViewController.m
//  3dTransform
//
//  Created by Ben Langholz on 3/16/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "testViewController.h"
#import "mainViewController.h"

@interface testViewController ()
@property (nonatomic, strong) UIButton *backButton;


@end

@implementation testViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
