//
//  PropertyName.h
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Unit;

@interface Building : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray <Unit *> *units;

- (instancetype)initWithName:(NSString *)name withUnits:(NSArray <Unit *> *)units;

@end
