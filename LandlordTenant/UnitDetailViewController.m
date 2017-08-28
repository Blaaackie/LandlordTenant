//
//  UnitDetailViewController.m
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-23.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "UnitDetailViewController.h"

@interface UnitDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *unitDetailCellImage;
@property (weak, nonatomic) IBOutlet UITextView *unitComplaintDescriptionView;

@end

@implementation UnitDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
    
}

- (void)configureView
{
    if (self.complaint.type == general) {
         self.unitDetailCellImage.image = [UIImage imageNamed:@"NewGeneral"];
    } else if (self.complaint.type == maintenance) {
        self.unitDetailCellImage.image = [UIImage imageNamed:@"NewWrench (1)"];
    } else if(self.complaint.type == noise) {
         self.unitDetailCellImage.image = [UIImage imageNamed:@"NewSound"];
    }
    self.unitComplaintDescriptionView.text = [NSString stringWithFormat:@"%@", self.complaint.complaintDescription];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
