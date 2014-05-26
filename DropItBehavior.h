//
//  DropItBehavior.h
//  DropIt
//
//  Created by Ann Greyson on 1/12/14.
//  Copyright (c) 2014 Ann Greyson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropItBehavior : UIDynamicBehavior

-(void)addItem:(id <UIDynamicItem>)item;
-(void)removeItem:(id <UIDynamicItem>)item;


@end
