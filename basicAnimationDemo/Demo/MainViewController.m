//
//  MainViewController.m
//  Demo
//
//  Created by Ben Langholz on 2/11/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *myWhiteView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)moveButton:(id)sender;

- (IBAction)onButton:(id)sender;
- (void)sayHello;
- (void)sayMyName:(NSString *)name;
- (void)sayMyFirstName:(NSString *)firstName lastName:(NSString *)lastName;


@property (nonatomic)int y;

@end

@implementation MainViewController

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

    //For console
    NSLog(@"view did load");
    
    //Variables
    
    int x;
    float y; //1.342
    double z; // 1.234
    BOOL h; // YES or NO
    h = YES;
    
    CGRect lableFrame = CGRectMake(0, 0, 50, 100);
    CGSize size;
    CGPoint point;
    
    NSString *name;
    NSArray *array;
    NSDictionary *dictionary;
    
    UIViewController *vc;
    UILabel *lable;
    
//    User *joe = [[User alloc] init];
//    User *bill = [[User alloc] init];
    
    
    self.y;
    
    

    

    
    
    
    
    
    
    
    self.myWhiteView.backgroundColor = [UIColor redColor];
//    self.myWhiteView.layer.borderColor = [UIColor greenColor].CGColor;
//    self.myWhiteView.layer.borderWidth = 3;
    self.myWhiteView.layer.cornerRadius = 4;
    self.myWhiteView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.myWhiteView.layer.shadowOffset = CGSizeMake(5,5);
    self.myWhiteView.layer.shadowOpacity = 1;
    self.myWhiteView.layer.shadowRadius = 5;
    
    CGRect frame = CGRectMake(2,2,50,80);
    UIView *orangeView = [[UIView alloc] initWithFrame: frame];
    orangeView.backgroundColor = [UIColor orangeColor];
    
//    CGrect blueFrame = CGRectMake(0,orangeView.frame.origin.y + orangeView.frame.size.height + 20 ,30,30);
//    UIView *blueView = [[UIView alloc] initWithFrame:blueFrame];
//    blueView.backgroundColor = [UIColor blueColor];
//    [self.greenView addSubview:blueView];

    
    [self.myWhiteView addSubview: orangeView];
    
//    [self.button setTitleColor:[UIColor redColor] forState:[UIControlStateNormal];
    
                          
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"view did appear");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)moveButton:(id)sender {
//    Simple animation!
    
    CGRect frame = self.textField.frame;
    
    frame.origin.y =frame.origin.y - 20;
    
    [UIView animateWithDuration:.2 animations:^{
        self.textField.frame = frame;
//      self.textField.center;
//      self.textField.alpha;
//      self.textField.transform;
    }];
}

- (IBAction)onButton:(id)sender {
    [self sayHello];
    
    [self sayMyName:@"tim"];
    [self sayMyName:@"Alex" ];
    [self sayMyFirstName:@"james" lastName:@"bond"];

}

#pragma mark - Priivate methods

- (void)sayHello {
    NSLog(@"hello!");
}

- (void)sayMyName:(NSString *)name{
    NSLog(@"Hello, %@, you're awesome! Seriously, %@, really awesome.", name, name);
}

- (void)sayMyFirstName:(NSString *)firstName lastName: (NSString *)lastName{
    NSLog(@"My name is %@ %@ %@", lastName, firstName, lastName);
}




@end
