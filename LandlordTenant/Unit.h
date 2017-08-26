//
//  Unit.h
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Building.h"
#import "Tenant.h"
//#import "LandlordTenant-Bridging-Header.h"

@interface Unit : NSObject
@property (nonatomic, assign) int unitNumber;
@property (nonatomic, assign) BOOL isVacant;
@property (nonatomic, strong) NSString *tenant;
@property (nonatomic, assign) int color;

- (instancetype)initWithUnitNumber:(int)unitNumber withTenant:(NSString *)tenant isVacant:(BOOL)isVacant;

@end
