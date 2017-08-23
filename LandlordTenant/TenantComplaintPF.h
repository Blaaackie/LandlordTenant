//
//  TenantComplaintPF.h
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-23.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <Parse/Parse.h>

typedef NS_ENUM(NSUInteger, ComplaintType) {
    maintenance = 1,
    noise = 2,
    general = 3
};

@interface TenantComplaintPF : PFObject <PFSubclassing>

@property (nonatomic, copy) NSString* complaintDescription;
@property (nonatomic, copy) NSDate* date;
@property (nonatomic, assign) ComplaintType type;

- (instancetype)initWithType:(ComplaintType)type date:(NSDate*)date description:(NSString*)complaintDescription;

@end

