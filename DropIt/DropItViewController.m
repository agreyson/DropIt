//
//  DropItViewController.m
//  DropIt
//
//  Created by Ann Greyson on 1/12/14.
//  Copyright (c) 2014 Ann Greyson. All rights reserved.
//

#import "DropItViewController.h"
#import "DropItBehavior.h"

@interface DropItViewController ()
@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) DropItBehavior *dropItBehavior;


@end

@implementation DropItViewController

static const CGSize Drop_Size = {40, 40};

- (UIDynamicAnimator *)animator
{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.gameView];
    }
    return _animator;
}

- (DropItBehavior *)dropItBehavior
{
    if (!_dropItBehavior) {
        _dropItBehavior = [[DropItBehavior alloc]init];
        [self.animator addBehavior:_dropItBehavior];
    }
    return _dropItBehavior;
}

- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    [self drop];
}

- (void)drop
{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = Drop_Size;
    int x = (arc4random()%(int)self.gameView.bounds.size.width)/Drop_Size.width;
    frame.origin.x = x * Drop_Size.width;
    UIView *dropView = [[UIView alloc]initWithFrame:frame];
    dropView.backgroundColor = [self randomColor];
    [self.gameView addSubview:dropView];
    
    [self.dropItBehavior addItem:dropView];
}

- (UIColor *)randomColor
{
    switch (arc4random()%5) {
        case 0: return [UIColor greenColor];
        case 1: return [UIColor blueColor];
        case 2: return [UIColor orangeColor];
        case 3: return [UIColor redColor];
        case 4: return [UIColor purpleColor];
    }
    return [UIColor blackColor];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
