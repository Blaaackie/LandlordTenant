//
//  UnitTableViewCell.h
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Unit.h"

@interface UnitTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *unitLabel;

- (void)configureCellWithUnit:(Unit *)unit;

@end
