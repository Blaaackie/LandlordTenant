//
//  TenantComplaintPF.m
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-23.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "TenantComplaintPF.h"
#import <Parse/PFObject+Subclass.h>

@implementation TenantComplaintPF

@dynamic type, date, complaintDescription;

+ (void)load {
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"TenantComplaint";
}

- (instancetype)initWithType:(ComplaintType)type date:(NSDate*)date description:(NSString*)complaintDescription
{
    self = [super init];
    if (self) {
        self.type = type;
        self.date = date;
        self.complaintDescription = complaintDescription;
    }
    return self;
}

@end
