//
//  PropertyName.m
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import "Building.h"

@implementation Building

- (instancetype)initWithName:(NSString *)name withUnits:(NSArray <Unit *> *)units;
{
    if (self = [super init])
    {
        _name = name;
        _units = units;
    }
    return self;
}

@end
