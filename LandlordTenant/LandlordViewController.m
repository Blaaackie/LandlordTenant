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
@property (nonatomic, strong) NSMutableArray *propertyArray;
@property (weak, nonatomic) IBOutlet UILabel *landlordNameLabel;

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
    
    self.propertyArray = [@[unit100, unit201] mutableCopy];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.propertyArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UnitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UnitCell" forIndexPath:indexPath];
    
    Unit *unitObject = self.propertyArray[indexPath.row];
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
