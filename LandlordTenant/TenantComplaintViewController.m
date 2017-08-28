//
//  TenantComplaintViewController.m
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "TenantComplaintViewController.h"
#import "TenantComplaintDetailViewController.h"
#import "TenantComplaintPF.h"
#import "ComplaintCell.h"

@interface TenantComplaintViewController ()

@property (weak, nonatomic) IBOutlet UITableView *complaintHistoryView;
@property (nonatomic, strong) NSArray <TenantComplaintPF*> *complaints;

@end

@implementation TenantComplaintViewController


- (IBAction)generalButton:(id)sender {
}
- (IBAction)noiseButton:(id)sender {
}
- (IBAction)maintenanceButton:(id)sender {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.complaints = [[NSArray alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    // Fetch Parse data -- Only 1 user to call data from at the moment
    
    PFQuery *query = [TenantComplaintPF query];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            return;
        }
        
        // Sort the requests in order of most recent request at the top
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
        NSArray *sortDescriptorArray = [NSArray arrayWithObject:sortDescriptor];
        
        self.complaints = [objects sortedArrayUsingDescriptors:sortDescriptorArray];
        
        dispatch_async(dispatch_get_main_queue(), ^{

            [self.complaintHistoryView reloadData];
        });
    }];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // Based on the button selected in the request screen, will show that icon and type of complaint in the details screen
    TenantComplaintDetailViewController *vc = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"maintenanceButtonSegue"]) {
        
        vc.complaintType = maintenance;
    } else if ([segue.identifier isEqualToString:@"noiseButtonSegue"]) {
        
        vc.complaintType = noise;
    } if ([segue.identifier isEqualToString:@"generalButtonSegue"]) {
        
        vc.complaintType = general;
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.complaints count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ComplaintCell *complaintCell = [tableView dequeueReusableCellWithIdentifier:@"tenantCell"];

    TenantComplaintPF * myComplaint = self.complaints[indexPath.row];
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString = [df stringFromDate:myComplaint.date];
    complaintCell.complaintDescriptionLabel.text = myComplaint.complaintDescription;
    complaintCell.timeStampLabel.text = dateString;
    
    if (myComplaint.type == general) {
        complaintCell.complaintTypeImageView.image = [UIImage imageNamed:@"NewGeneral"];
    } else if (myComplaint.type == maintenance) {
        complaintCell.complaintTypeImageView.image = [UIImage imageNamed:@"NewWrench (1)"];
    } else if (myComplaint.type == noise) {
        complaintCell.complaintTypeImageView.image = [UIImage imageNamed:@"NewSound"];
    }
    return complaintCell;
}


@end
