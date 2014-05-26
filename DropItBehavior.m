//
//  DropItBehavior.m
//  DropIt
//
//  Created by Ann Greyson on 1/12/14.
//  Copyright (c) 2014 Ann Greyson. All rights reserved.
//

#import "DropItBehavior.h"

@interface DropItBehavior ()
@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collider;
@end

@implementation DropItBehavior


- (UIGravityBehavior *)gravity
{
    if (!_gravity){
        _gravity = [[UIGravityBehavior alloc]init];
        _gravity.magnitude = 0.9;
    }
    return _gravity;
}

- (UICollisionBehavior *)collider
{
    if (!_collider) {
        _collider = [[UICollisionBehavior alloc]init];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
    }
    return _collider;
}

-(void)addAnItem:(id <UIDynamicItem>)item
{
    [self.gravity addItem:item];
    [self.collider addItem:item];
}
-(void)removeItem:(id <UIDynamicItem>)item
{
    [self.gravity removeItem:item];
    [self.collider removeItem:item];

}

- (instancetype)init
{
    
    self = [super init];
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collider];
    return self;
}

@end
