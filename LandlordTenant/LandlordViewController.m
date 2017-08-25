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
#import "TenantComplaintPF.h"

@interface LandlordViewController () <UITableViewDataSource, UITableViewDelegate, UnitViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *landlordTableView;
@property (weak, nonatomic) IBOutlet UILabel *landlordNameLabel;
@property (nonatomic, strong) NSArray <Building *> *buildings;
@property (nonatomic, strong) TenantComplaintPF *post;
@property (nonatomic, strong) NSArray <TenantComplaintPF *> *complaints;
@property (nonatomic, assign) id colorIndicator;

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
    Landlord *landlord = [[Landlord alloc] initWithname:@"Bill Gates"];

    self.landlordNameLabel.text = [NSString stringWithFormat:@"%@", landlord.landlordName];
    
    [self unitInformation];
    
}

- (void)unitInformation
{
    Unit *unit201 = [[Unit alloc] initWithUnitNumber:201 withTenant:@"Vacant" isVacant:YES];// andColor:1];
    Unit *unit205 = [[Unit alloc] initWithUnitNumber:205 withTenant:@"Tye Blackie" isVacant:NO];// andColor:2];
    Unit *unit1805 = [[Unit alloc] initWithUnitNumber:1805 withTenant:@"Linh Tu" isVacant:NO];// andColor:1];
    
    Building *building1 = [[Building alloc] initWithName:@"Lighthouse Labs - 128 W Hastings St" withUnits:@[unit201, unit205]];
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    PFQuery *query = [TenantComplaintPF query];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        NSDictionary *lastComplaintObject = [objects lastObject];
        int colorIndicator = [(NSNumber *)[lastComplaintObject objectForKey:@"type"] intValue];
        
        if([((UnitTableViewCell*)cell).tenantName isEqualToString:@"Tye Blackie"]) {
            if (colorIndicator == 1) {
                cell.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(177/255.0) blue:(187/255.0) alpha:1];
            } else if (colorIndicator == 2) {
                cell.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(232/255.0) blue:(182/255.0) alpha:1];
            } else if(colorIndicator == 3) {
                cell.backgroundColor = [UIColor colorWithRed:(230/255.0) green:(228/255.0) blue:(233/255.0) alpha:1];;
            }
        }
        
        
    }];
    // Calls the last object in array and display corresponding color

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

- (void)setLabelWithText:(NSString *)textLabel
{}
 

@end
