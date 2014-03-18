//
//  mainViewController.m
//  3dTransform
//
//  Created by Ben Langholz on 3/16/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "mainViewController.h"
#import "testViewController.h"

@interface mainViewController ()
@property (nonatomic, strong) UIScrollView *cardHolder;
@property (nonatomic, strong) UIView *card;
@property (nonatomic, assign) BOOL isForward;
@property (nonatomic, assign) NSUInteger *cardIndex;
@property (nonatomic, assign) CGPoint ogPos;



@end

@implementation mainViewController

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
    
    self.isForward = NO;
    
    self.cardHolder = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.cardHolder];
    
    self.cardHolder.clipsToBounds = NO;
    self.cardHolder.scrollEnabled = NO;
    
    //How do I set this based on requestTab height??
    self.cardHolder.contentSize=CGSizeMake(320,2000);
    
    NSMutableArray *imageNameArray = [[NSMutableArray alloc] initWithObjects:@"loboLarge",@"gochLarge",@"misoLarge",@"tugOfWar",@"ears",@"onABridge",@"overTheHill", nil];
    
    
    NSLog(@"count %lu", (unsigned long)imageNameArray.count);
    
    [imageNameArray enumerateObjectsUsingBlock:^(NSString *imageName, NSUInteger idx, BOOL *stop) {
        
        self.card = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1136/2)];
        [self.cardHolder addSubview: self.card];
        
        self.card.frame = CGRectMake(0, 50*idx, 320, 1136/2);
        
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *cardImage = [[UIImageView alloc] initWithImage:image];
        cardImage.frame = CGRectMake(0, 0, 320, 1136/2);
        [self.card addSubview:cardImage];
        
//        self.cardIndex = idx;
//        NSUInteger *cardIndex2 = idx;

        
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -800.0;
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, (-M_PI_2 * 0.6), 1.0f, 0.0f, 0.0f);
        
        self.card.layer.anchorPoint = CGPointMake(.5, 0);
        self.card.layer.position = CGPointMake(320/2, 1136/2);
        
        [UIView animateWithDuration:1 delay:.2*idx+.5 options: UIViewAnimationOptionCurveEaseInOut animations:^{
            self.card.layer.anchorPoint = CGPointMake(.5, 0);
            self.card.layer.transform = rotationAndPerspectiveTransform;
            self.card.layer.position = CGPointMake(320/2, 80*(idx+0));
        } completion:^(BOOL finished) {
            self.cardHolder.scrollEnabled = YES;
        }];
        
        [self.card addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapGesture:)]];
    }];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)onTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    //Get the view I tapped on
    UIView *tappedView = tapGestureRecognizer.view;
    
    self.cardHolder.scrollEnabled = NO;

//    NSLog(@"tap %ui", self.cardIndex);
    

    if (self.isForward) {
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -800.0;
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, (-M_PI_2 * 0.6), 1.0f, 0.0f, 0.0f);
        
        [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            tappedView.layer.anchorPoint = CGPointMake(.5, 0);
            tappedView.layer.transform = rotationAndPerspectiveTransform;
            tappedView.layer.position = self.ogPos;
        } completion:^(BOOL finished) {
            self.cardHolder.scrollEnabled = YES;
        }];
    } else {
        //set point card is coming from
        self.ogPos = tappedView.layer.position;
        
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -800.0;
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 0, 1.0f, 0.0f, 0.0f);
        
        [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            tappedView.layer.anchorPoint = CGPointMake(.5, 0);
            tappedView.layer.transform = rotationAndPerspectiveTransform;
            tappedView.layer.position = CGPointMake(320/2, 0);
        } completion:^(BOOL finished) {
//            UIViewController *vc = [[testViewController alloc] init];
//            vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve; // Fade
//            [self presentViewController:vc animated:NO completion:nil];
        }];
    }
    

    self.isForward = !self.isForward;
//    [UIView animateWithDuration:1 animations:^{
//        view.frame = CGRectMake(1000, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
//    }];
    
    
}


@end
