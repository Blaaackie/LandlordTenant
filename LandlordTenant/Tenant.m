//
//  Tenant.m
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "Tenant.h"

@implementation Tenant

-(instancetype) initWithName:(NSString*)name phoneNumber:(NSString*)phoneNumber unitNumber:(NSString*)unitNumber{
    self = [super init];
    if (self) {
        _name = name;
        _phoneNumber = phoneNumber;
        _unitNumber = unitNumber;
    }
    return self;
}

@end
