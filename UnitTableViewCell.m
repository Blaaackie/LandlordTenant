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
    if (unit.isVacant)
    {
//        self.unitLabel.text = [NSString stringWithFormat:@"Unit %d - Vacant", unit.unitNumber];
//        self.unitLabel.attributedText = [[NSAttributedString alloc] initWithString:vacantUnit attributes:@{NSFontAttributeName: [UIFont italicSystemFontOfSize:[UIFont systemFontSize]]}];
        NSString *vacantUnit = [NSString stringWithFormat:@"Unit %d - Vacant", unit.unitNumber];
        self.unitLabel.attributedText = [[NSAttributedString alloc] initWithString:vacantUnit attributes:@{NSFontAttributeName: [UIFont italicSystemFontOfSize:17]}];
    }
    else
    {
        self.unitLabel.text = [NSString stringWithFormat:@"Unit %d - <Insert Tenant Name>", unit.unitNumber];
    }
}

@end
