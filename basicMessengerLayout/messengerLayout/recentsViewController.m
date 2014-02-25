//
//  recentsViewController.m
//  messengerLayout
//
//  Created by Ben Langholz on 2/25/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "recentsViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface recentsViewController ()

@end

@implementation recentsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Recent";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *messageContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 70)];
    messageContainer.backgroundColor = [UIColor blueColor];
    [self.view addSubview:messageContainer];
    
    UIView *profilePicture = [[UIView alloc] initWithFrame:CGRectMake(12, 5, 60, 60)];
    profilePicture.backgroundColor = [UIColor redColor];
    [messageContainer addSubview:profilePicture];
    
    UILabel *conversationName = [[UILabel alloc] initWithFrame:CGRectMake(85, 10, 200, 30)];
    conversationName.text = @"Mac Tyler";
    conversationName.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
    conversationName.textColor = [UIColor whiteColor];
    [messageContainer addSubview:conversationName];
    
    UILabel *messagePreview = [[UILabel alloc] initWithFrame:CGRectMake(85, 30, 200, 30)];
    messagePreview.text = @"Hey there how are you today?";
    messagePreview.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
    messagePreview.textColor = [UIColor grayColor];
    [messageContainer addSubview:messagePreview];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
