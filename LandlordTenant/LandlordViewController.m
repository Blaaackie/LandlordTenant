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
#import "UnitTableViewCell.h"

@interface LandlordViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *landlordTableView;
@property (weak, nonatomic) IBOutlet UILabel *landlordNameLabel;
@property (nonatomic, strong) NSArray <Building *> *buildings;

@end

@implementation LandlordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialSetup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Landlord Setup

- (void)initialSetup
{
    Landlord *landlord1 = [[Landlord alloc] initWithname:@"Bill"];

    self.landlordNameLabel.text = [NSString stringWithFormat:@"%@", landlord1.landlordName];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
