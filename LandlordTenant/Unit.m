//
//  Unit.m
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "Unit.h"

@implementation Unit

- (instancetype)initWithUnitNumber:(int)unitNumber isVacant:(BOOL)isVacant
{
    if (self = [super init])
    {
        _unitNumber = unitNumber;
        _isVacant = isVacant;
    }
    return self;
}

@end
