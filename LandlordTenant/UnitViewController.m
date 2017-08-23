//
//  UnitViewController.m
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-22.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "UnitViewController.h"
#import "TenantComplaintPF.h"

@interface UnitViewController ()
@property (nonatomic, strong) NSString *cellTextLabel;
@property (weak, nonatomic) IBOutlet UITableView *unitTableView;
@property (nonatomic, strong) NSArray <TenantComplaintPF *> *complaints;

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
    [query whereKey:@"complaintDescription" hasPrefix:@"<<Unit>>"];
    [query whereKey:@"type" equalTo:@(1)];
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

#pragma mark - Unit View Controller Delegate Methods
- (void)setLabelWithText:(NSString *)textLabel
{
    self.cellTextLabel = textLabel;
}

@end
