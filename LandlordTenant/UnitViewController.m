//
//  UnitViewController.m
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-22.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "UnitViewController.h"
#import "TenantComplaintPF.h"
#import "TenantViewController.h"
#import "TenantComplaintDetailViewController.h"
#import "UnitDetailViewController.h"

@interface UnitViewController ()
@property (nonatomic, strong) NSString *cellTextLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *complaintLabel;
@property (weak, nonatomic) IBOutlet UITableView *unitTableView;
@property (nonatomic, strong) NSArray <TenantComplaintPF *> *complaints;
@property (nonatomic, strong) TenantComplaintPF *post;

@end

@implementation UnitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.title = [NSString stringWithFormat:@"%@", self.unit]; // For Header of Unit Table View
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    PFQuery *query = [TenantComplaintPF query];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        self.complaints = objects;
        
        [self.unitTableView reloadData];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Unit's Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.complaints.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UnitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ComplaintCell" forIndexPath:indexPath];
    
    self.post = self.complaints[indexPath.row];
    cell.unitLabel.text = self.post.complaintDescription;
    
    if (self.post.type == 1) {
        cell.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(177/255.0) blue:(187/255.0) alpha:1];
    } else if (self.post.type == 2) {
        cell.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(232/255.0) blue:(182/255.0) alpha:1];
    } else if (self.post.type == 3) {
        cell.backgroundColor = [UIColor colorWithRed:(230/255.0) green:(228/255.0) blue:(233/255.0) alpha:1];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Calls the last object in array and display corresponding color
    
//    if (self.post.type == 1)
//    {
//        cell.backgroundColor = [UIColor blueColor];
//    }
//    else if (self.post.type == 2)
//    {
//        cell.backgroundColor = [UIColor redColor];
//    }
//    else if (self.post.type == 3)
//    {
//        cell.backgroundColor = [UIColor whiteColor];
//    }
}

#pragma mark - Unit View Controller Delegate Methods
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toUnitDetailView" sender:[self.unitTableView cellForRowAtIndexPath:indexPath]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    NSIndexPath *selectedIndexPath = [self.unitTableView indexPathForSelectedRow];
    if ([segue.identifier isEqualToString:@"toUnitDetailView"])
    {
//        TenantComplaintPF *complaint = [self.complaints objectAtIndex:selectedIndexPath.row];
        UnitTableViewCell *cell = (UnitTableViewCell *)sender;
        NSIndexPath *selectedIndexPath = [self.unitTableView indexPathForCell:cell];
        
        Unit *unit = [self.complaints objectAtIndex:selectedIndexPath.item];
        UnitDetailViewController *detailVC = [segue destinationViewController];
        detailVC.complaintType = unit;
    }
    // destinationViewController from landlord's unit complaint
}

- (void)setLabelWithText:(NSString *)textLabel
{
    self.cellTextLabel = textLabel;
}

@end
