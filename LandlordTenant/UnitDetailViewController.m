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
@property (weak, nonatomic) IBOutlet UILabel *unitComplaintTypeLabel;
@property (weak, nonatomic) IBOutlet UITextView *unitComplaintDescriptionView;

@end

@implementation UnitDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
    
}

- (void)configureView
{
    if (self.complaintType == general){
        self.unitComplaintTypeLabel.text = @"General";
         self.unitDetailCellImage.image = [UIImage imageNamed:@"NewGeneral"];
    }else if (self.complaintType == maintenance){
        self.unitComplaintTypeLabel.text = @"Maintenance";
        self.unitDetailCellImage.image = [UIImage imageNamed:@"NewWrench (1)"];
    }else if(self.complaintType == noise){
        self.unitComplaintTypeLabel.text = @"Noise";
         self.unitDetailCellImage.image = [UIImage imageNamed:@"NewSound"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
