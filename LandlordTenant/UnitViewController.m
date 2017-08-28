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
@property (weak, nonatomic) IBOutlet UITableView *unitTableView;
@property (nonatomic, strong) NSArray <TenantComplaintPF *> *complaints;
@property (nonatomic, strong) TenantComplaintPF *post;

@end

@implementation UnitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)fetchData // Fetch Parse data for second  -- Only 1 user to call data from at the moment
{
    PFQuery *query = [TenantComplaintPF query];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
        NSArray *sortDescriptorArray = [NSArray arrayWithObject:sortDescriptor];
        
        self.complaints = [objects sortedArrayUsingDescriptors:sortDescriptorArray];
        
        [self.unitTableView reloadData];
        
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self fetchData];
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
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString = [dateFormatter stringFromDate:self.post.date];
    cell.comlaintDescriptionLabel.text = self.post.complaintDescription;
    cell.timeStampLabel.text = dateString;
    
    switch (self.post.type)
    {
        case general:
        {
            cell.complaintColourImageView.backgroundColor = [UIColor colorWithRed:(230/255.0) green:(228/255.0) blue:(233/255.0) alpha:1];
            cell.complaintTypeImageView.image = [UIImage imageNamed:@"NewGeneral"];
            break;
        }
        case maintenance:
        {
            cell.complaintColourImageView.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(177/255.0) blue:(187/255.0) alpha:1];
            cell.complaintTypeImageView.image = [UIImage imageNamed:@"NewWrench (1)"];
            break;
        }
        case noise:
        {
            cell.complaintColourImageView.backgroundColor = [UIColor colorWithRed:(255/255.0) green:(232/255.0) blue:(182/255.0) alpha:1];
            cell.complaintTypeImageView.image = [UIImage imageNamed:@"NewSound"];
            break;
        }
        default:
            break;
    }
    return cell;
}

#pragma mark - Unit View Controller Delegate Methods
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toUnitDetailView" sender:[self.unitTableView cellForRowAtIndexPath:indexPath]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toUnitDetailView"])
    {
        UnitTableViewCell *cell = (UnitTableViewCell *)sender;
        NSIndexPath *selectedIndexPath = [self.unitTableView indexPathForCell:cell];
        
        TenantComplaintPF *complaint = [self.complaints objectAtIndex:selectedIndexPath.item];
        UnitDetailViewController *detailVC = [segue destinationViewController];
        detailVC.complaint = complaint;
    }
}

- (void)setLabelWithText:(NSString *)textLabel
{
    self.cellTextLabel = textLabel;
}

- (IBAction)refreshButton:(UIButton *)sender {
    
    [self fetchData];
}

@end
