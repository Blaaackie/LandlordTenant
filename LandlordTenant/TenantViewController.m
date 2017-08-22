//
//  ViewController.m
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "TenantViewController.h"
#import "Tenant.h"

@interface TenantViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *unitNumberLabel;

@property (weak, nonatomic) IBOutlet UIButton *addRequestButton;


@end

@implementation TenantViewController

- (IBAction)AddRequestButton:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  Tenant *tenant = [[Tenant alloc] initWithName:@"Tye Blackie"
                                    phoneNumber:@"403.680.9430"
                                     unitNumber:@"Unit 205"];
    
    self.nameLabel.text = tenant.name;
    self.phoneNumberLabel.text = tenant.phoneNumber;
    self.unitNumberLabel.text = tenant.unitNumber;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end