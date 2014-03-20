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
@property (nonatomic, strong) NSMutableArray *imageViewsArray;
@property (nonatomic, assign) float scrollOffset;
@property (nonatomic, assign) int *imageViewArrayCount;



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
    
    self.imageViewsArray = [[NSMutableArray alloc]init];
    
    NSMutableArray *imageNameArray = [[NSMutableArray alloc] initWithObjects:@"loboLarge",@"gochLarge",@"misoLarge",@"tugOfWar",@"ears",@"onABridge",@"overTheHill",@"StopSleeping", nil];

    NSLog(@"count %lu", (unsigned long)imageNameArray.count);
    
    self.cardHolder = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.cardHolder];
    [self.cardHolder setDelegate:self];
    //    NSLog(@"Scroll %@",NSStringFromCGPoint(self.cardHolder.contentOffset));
    
    
    self.cardHolder.clipsToBounds = NO;
    self.cardHolder.scrollEnabled = NO;
    
    //How do I set this based on requestTab height??
    
    self.cardHolder.contentSize=CGSizeMake(320,(160/2)*imageNameArray.count+(264/2));
    
    [imageNameArray enumerateObjectsUsingBlock:^(NSString *imageName, NSUInteger idx, BOOL *stop) {
        
        self.card = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1136/2)];
        [self.cardHolder addSubview: self.card];
        
        [self.imageViewsArray addObject:self.card];
        
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
    
//    NSLog(@"array %@",self.imageViewsArray);
    
    self.imageViewArrayCount = self.imageViewsArray.count;
    
    NSLog(@"Image View Array Count %i",self.imageViewArrayCount);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//  Figure out scroll offset
    self.scrollOffset = scrollView.contentOffset.y;
//    NSLog(@"scroll %f",self.scrollOffset);

}

- (void)onTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    
    float durration = .5;
    
    //Get the view I tapped on
    UIView *tappedView = tapGestureRecognizer.view;
    //Get the index of the tappedView
    int tappedViewIndex = [self.imageViewsArray indexOfObject:tappedView];
    
    NSLog(@"tappedView index %d", tappedViewIndex);
    
    self.cardHolder.scrollEnabled = NO;
    
    if (self.isForward) {
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -800.0;
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, (-M_PI_2 * 0.6), 1.0f, 0.0f, 0.0f);
        
        [UIView animateWithDuration:durration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            tappedView.layer.anchorPoint = CGPointMake(.5, 0);
            tappedView.layer.transform = rotationAndPerspectiveTransform;
            tappedView.layer.position = self.ogPos;
        } completion:^(BOOL finished) {
            self.cardHolder.scrollEnabled = YES;
        }];
        
        for (int i = 0 ; i < self.imageViewArrayCount; i++) {
            
            UIView *cardView = [self.imageViewsArray objectAtIndex:i];
            
            CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
            rotationAndPerspectiveTransform.m34 = 1.0 / -800.0;
            rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, -M_PI_2 * 0.6, 1.0f, 0.0f, 0.0f);
            
            [UIView animateWithDuration:durration delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseOut animations:^{
                cardView.layer.anchorPoint = CGPointMake(.5, 0);
                cardView.layer.transform = rotationAndPerspectiveTransform;
                cardView.layer.position = CGPointMake(320/2, 80*(i+0));
            } completion:^(BOOL finished) {
                //
            }];
            
        };
        
    } else {
        //set point card is coming from
        self.ogPos = tappedView.layer.position;
        
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -800.0;
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 0, 1.0f, 0.0f, 0.0f);
        
        [UIView animateWithDuration:durration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            tappedView.layer.anchorPoint = CGPointMake(.5, 0);
            tappedView.layer.transform = rotationAndPerspectiveTransform;
            tappedView.layer.position = CGPointMake(320/2, (0+self.scrollOffset));
        } completion:^(BOOL finished) {
//      when card focused swap with view controller
//            UIViewController *vc = [[testViewController alloc] init];
//            vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve; // Fade
//            [self presentViewController:vc animated:NO completion:nil];
        }];
        

        //Move cars above and below tappedCard
        for (int i = 0 ; i < self.imageViewArrayCount; i++) {
            UIView *cardView = [self.imageViewsArray objectAtIndex:i];
            
            CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
            rotationAndPerspectiveTransform.m34 = 1.0 / -800.0;
            rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, -M_PI_2, 1.0f, 0.0f, 0.0f);
            
            if (i < tappedViewIndex) {
                [UIView animateWithDuration:durration delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                    cardView.layer.anchorPoint = CGPointMake(.5, 0);
                    cardView.layer.transform = rotationAndPerspectiveTransform;
                    cardView.layer.position = CGPointMake(320/2, - 80 - (26*(i+0)) +self.scrollOffset);
                } completion:^(BOOL finished) {
                    //
                }];
            } else if ( i > tappedViewIndex) {
                [UIView animateWithDuration:durration delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                    cardView.layer.position = CGPointMake(320/2, 1136/2 + (26*(i+0)) + self.scrollOffset);
                } completion:^(BOOL finished) {
                    //
                }];
                
            }

        };
        
    }
    

    self.isForward = !self.isForward;
//    [UIView animateWithDuration:1 animations:^{
//        view.frame = CGRectMake(1000, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
//    }];
    
    
}


@end
