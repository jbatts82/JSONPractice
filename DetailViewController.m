//
//  DetailViewController.m
//  AnotherJSONApp
//
//  Created by John Battaglia on 4/13/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize ingredientsLabel, itemNameLabel, deluxeItemsLabel, priceLabel, currentItem;

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
    // Do any additional setup after loading the view.
    
    //load up the UI
    [self setLabels];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Methods

-(void)getItem:(id)menuObject
{
    currentItem = menuObject;
}

- (void)setLabels
{
    itemNameLabel.text = currentItem.itemName;
    ingredientsLabel.text = currentItem.ingredients;
    deluxeItemsLabel.text = currentItem.deluxeInfo;
    priceLabel.text = currentItem.price;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
