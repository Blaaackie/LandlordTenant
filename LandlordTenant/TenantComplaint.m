//
//  TenantComplaint.m
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "TenantComplaint.h"

@implementation TenantComplaint




- (instancetype)initWithType:(ComplaintType)type date:(NSDate*)date description:(NSString*)complaintDescription
{
    self = [super init];
    if (self) {
        _type = type;
        _date = date;
        _complaintDescription = complaintDescription;
    }
    return self;
}

@end
