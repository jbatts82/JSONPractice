//
//  MenuViewController.h
//  AnotherJSONApp
//
//  Created by John Battaglia on 4/13/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *jsonArray;
@property (nonatomic, strong) NSMutableArray *menuArray;


#pragma mark -
#pragma mark Class Methods
- (void) retrieveData;



@end
