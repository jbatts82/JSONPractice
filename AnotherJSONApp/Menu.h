//
//  Menu.h
//  AnotherJSONApp
//
//  Created by John Battaglia on 4/13/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Menu : NSObject

@property (strong, nonatomic) NSString *itemID;
@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) NSString *itemGroup;
@property (strong, nonatomic) NSString *deluxeInfo;
@property (strong, nonatomic) NSString *ingredients;
@property (strong, nonatomic) NSString *price;


#pragma mark - 
#pragma mark Class Methods

- (id)initWithItemID: (NSString *)iID
         andItemName: (NSString *)iName
        andItemGroup: (NSString *)iGroup
           andDeluxe: (NSString *)deluxe
      andIngredients: (NSString *)theIngredients
            andPrice: (NSString *)thePrice;



@end
