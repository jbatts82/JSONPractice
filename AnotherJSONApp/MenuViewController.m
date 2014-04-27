//
//  MenuViewController.m
//  AnotherJSONApp
//
//  Created by John Battaglia on 4/13/14.
//  Copyright (c) 2014 John Battaglia. All rights reserved.
//

#import "MenuViewController.h"
#import "Menu.h"
#import "DetailViewController.h"

#define getDataURL @"http://localhost:8080/practice.php"

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize jsonArray, menuArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set the title of our VC
    self.title = @"Menu Items";
    
    //load data
    [self retrieveData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return menuArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    Menu *menuObject;
    menuObject = [menuArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = menuObject.itemGroup;
    
    //accessory
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([[segue identifier] isEqualToString:@"pushDetailView"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        //get the object for the selected row
        Menu *menuObject = [menuArray objectAtIndex:indexPath.row];
        
        [[segue destinationViewController] getItem:menuObject];
    }
}


#pragma mark -
#pragma mark Class Methods

- (void) retrieveData
{
    
    NSURL *url = [NSURL URLWithString:getDataURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    //set up our menu array
    menuArray = [[NSMutableArray alloc] init];
    
    //loop through our jsonArray
    for(int i = 0; i<jsonArray.count; i++)
    {
        
        //create our city object
        //objectForKey value must match exactly to JSON string keys
        NSString *mID = [[jsonArray objectAtIndex:i] objectForKey:@"MID"];
        NSString *mIName = [[jsonArray objectAtIndex:i] objectForKey:@"ItemName"];
        NSString *mGroupName = [[jsonArray objectAtIndex:i] objectForKey:@"GroupName"];
        NSString *mDeluxeItems = [[jsonArray objectAtIndex:i] objectForKey:@"DeluxeItems"];
        NSString *mIngredients = [[jsonArray objectAtIndex:i] objectForKey:@"Ingredients"];
        NSString *mPrice = [[jsonArray objectAtIndex:i] objectForKey:@"Price"];
        
        //add the menu object to our menu array
        [menuArray addObject:[[Menu alloc]initWithItemID:mID andItemName:mIName andItemGroup:mGroupName andDeluxe:mDeluxeItems andIngredients:mIngredients andPrice:mPrice]];
        
    }
    
    //reload our table view
    [self.tableView reloadData];
    
}

@end
