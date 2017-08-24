//
//  UnitViewController.h
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-22.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Unit.h"
#import "UnitTableViewCell.h"
#import "Landlord.h"

@protocol UnitViewControllerDelegate <NSObject>

- (void)setLabelWithText:(NSString *)textLabel;

@end

@interface UnitViewController : UIViewController <UnitViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) Unit *unit;
@property (nonatomic, weak) id <UnitViewControllerDelegate> delegate;

@end
