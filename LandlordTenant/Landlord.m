//
//  Landlord.m
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "Landlord.h"

@implementation Landlord

- (instancetype)initWithname:(NSString *)landlordName
{
    if (self = [super init])
    {
        _landlordName = landlordName;
    }
    return self;
}

@end
