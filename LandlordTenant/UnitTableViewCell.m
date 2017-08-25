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
    self.tenantName = unit.tenant;
    if (unit.isVacant)
    {
        NSString *vacantUnit = [NSString stringWithFormat:@"Unit %d - Vacant", unit.unitNumber];
        self.unitLabel.attributedText = [[NSAttributedString alloc] initWithString:vacantUnit attributes:@{NSFontAttributeName: [UIFont italicSystemFontOfSize:17]}];
    }
    else
    {
        self.unitLabel.text = [NSString stringWithFormat:@"Unit %d - %@", unit.unitNumber, unit.tenant];
        
        if (unit.color == 0) { // changing the cell's color of the unit in main Landlord View -- the hacky way
//            if (self.complaintsList.lastObject)
//            {
//                // something here to change colors to make Tye's stuff
//            }
//            self.backgroundColor = [UIColor clearColor];
//        } else if (unit.color == 1) {
//            self.backgroundColor = [UIColor blueColor];
//        } else if (unit.color == 2) {
//            self.backgroundColor = [UIColor redColor];
        }
        
    }
}

@end
