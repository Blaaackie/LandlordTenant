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

@interface TenantComplaintViewController ()

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    TenantComplaintDetailViewController *vc = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"maintenanceButtonSegue"]) {
        
        vc.complaintType = maintenance;
    } else if ([segue.identifier isEqualToString:@"noiseButtonSegue"]) {
        
        vc.complaintType = noise;
    } if ([segue.identifier isEqualToString:@"generalButtonSegue"]) {
        
        vc.complaintType = general;
    }


}


@end
