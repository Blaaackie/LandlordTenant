//
//  UnitTableViewCell.h
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Unit.h"
#import "Tenant.h"
#import "TenantViewController.h"
#import "TenantComplaintPF.h"

@interface UnitTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *unitLabel;
@property (nonatomic, strong) NSString *tenantName;
@property (nonatomic, strong) NSArray <TenantComplaintPF *> *complaintsList;
@property (nonatomic, strong) TenantComplaintPF *lastPost;
@property (weak, nonatomic) IBOutlet UIImageView *complaintTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;
@property (weak, nonatomic) IBOutlet UILabel *comlaintDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *complaintColourImageView;

- (void)configureCellWithUnit:(Unit *)unit;

@end
