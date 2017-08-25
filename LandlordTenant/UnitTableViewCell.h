//
//  UnitTableViewCell.h
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Unit.h"
//#import "LandlordTenant-Bridging-Header.h"
#import "Tenant.h"
#import "TenantViewController.h"
#import "TenantComplaintPF.h"

@interface UnitTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *unitLabel;
@property (nonatomic, strong) NSString *tenantName;
@property (nonatomic, strong) NSArray <TenantComplaintPF *> *complaintsList;
@property (nonatomic, strong) TenantComplaintPF *lastPost;

- (void)configureCellWithUnit:(Unit *)unit withTenant:(Tenant *) tenant;

@end
