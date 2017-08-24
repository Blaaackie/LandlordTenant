//
//  ComplaintCell.h
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-23.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComplaintCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *complaintDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *complaintTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;

@end
