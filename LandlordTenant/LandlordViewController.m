//
//  LandlordViewController.m
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "LandlordViewController.h"
#import "Landlord.h"
#import "Unit.h"
#import "UnitViewController.h"
#import "UnitTableViewCell.h"

@interface LandlordViewController () <UITableViewDataSource, UITableViewDelegate, UnitViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *landlordTableView;
@property (weak, nonatomic) IBOutlet UILabel *landlordNameLabel;
@property (nonatomic, strong) NSArray <Building *> *buildings;

@end

@implementation LandlordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self propertySetup];
}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:true];
}

#pragma mark - Initial Setup

- (void)propertySetup
{
    Landlord *landlord = [[Landlord alloc] initWithname:@"Bill"];

    self.landlordNameLabel.text = [NSString stringWithFormat:@"%@", landlord.landlordName];
    
    [self unitInformation];
    
}

- (void)unitInformation
{
    Unit *unit100 = [[Unit alloc] initWithUnitNumber:100 isVacant:NO];
    Unit *unit201 = [[Unit alloc] initWithUnitNumber:201 isVacant:YES];
    Unit *unit1805 = [[Unit alloc] initWithUnitNumber:1805 isVacant:NO];
    
    Building *building1 = [[Building alloc] initWithName:@"Lighthouse Labs - 128 W Hastings St" withUnits:@[unit100, unit201]];
    Building *building2 = [[Building alloc] initWithName:@"Harbour Centre - 555 W Hastings St" withUnits:@[unit1805]];
    
    self.buildings = @[building1, building2];
}

#pragma mark - Landlord Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.buildings.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Building *building = self.buildings[section];
    return building.name;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Building *building = self.buildings[section];
    NSArray *units = building.units;
    return units.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UnitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UnitCell" forIndexPath:indexPath];
    
    Building *building = self.buildings[indexPath.section];
    NSArray *units = building.units;
    
    Unit *unitObject = units[indexPath.row];
    [cell configureCellWithUnit:unitObject];
    
    return cell;
}

#pragma mark = Landlord Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toUnitTableView" sender:[self.landlordTableView cellForRowAtIndexPath:indexPath]];
}


- (void)setLabelWithText:(NSString *)textLabel
{
    
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toUnitTableView"])
    {
        UnitTableViewCell *cell = (UnitTableViewCell *)sender;
        NSIndexPath *selectedIndexPath = [self.landlordTableView indexPathForCell:cell];
        
        Unit *unit =  (Unit *) [self.buildings objectAtIndex:selectedIndexPath.item];
        UnitViewController *unitVC = [segue destinationViewController];
        unitVC.unit = unit;
        
        cell = [self.landlordTableView cellForRowAtIndexPath:self.landlordTableView.indexPathForSelectedRow];
        unitVC.title = cell.textLabel.text;
    }
}
 

@end
