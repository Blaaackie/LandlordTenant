//
//  UnitTableViewCell.m
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "UnitTableViewCell.h"

@implementation UnitTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCellWithUnit:(Unit *)unit
{
    self.unitLabel.text = [NSString stringWithFormat:@"Unit %d - <Tenant Name>", unit.unitNumber];
}

@end
