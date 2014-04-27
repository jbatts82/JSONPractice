//
//  DetailViewController.h
//  AnotherJSONApp
//
//  Created by John Battaglia on 4/13/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Menu.h"

@interface DetailViewController : UIViewController


@property (nonatomic,strong) IBOutlet UILabel *itemNameLabel;
@property (nonatomic,strong) IBOutlet UILabel *deluxeItemsLabel;
@property (nonatomic,strong) IBOutlet UILabel *ingredientsLabel;
@property (nonatomic,strong) IBOutlet UILabel *priceLabel;

@property (nonatomic, strong) Menu *currentItem;

#pragma mark -
#pragma mark Methods

-(void)getItem:(id)menuObject;
-(void)setLabels;
@end
