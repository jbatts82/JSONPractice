//
//  Menu.m
//  AnotherJSONApp
//
//  Created by John Battaglia on 4/13/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "Menu.h"

@implementation Menu

@synthesize itemID, itemName, itemGroup, deluxeInfo, ingredients, price;

- (id)initWithItemID: (NSString *)iID
         andItemName: (NSString *)iName
        andItemGroup: (NSString *)iGroup
           andDeluxe: (NSString *)deluxe
      andIngredients: (NSString *)theIngredients
            andPrice: (NSString *)thePrice
{
    self = [super init];
    if(self)
    {
        itemID = iID;
        itemName = iName;
        itemGroup = iGroup;
        deluxeInfo = deluxe;
        ingredients = theIngredients;
        price = thePrice;
    }
    
    return self;
}

@end
