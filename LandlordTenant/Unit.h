//
//  Unit.h
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Unit : NSObject
@property (nonatomic, assign) int unitNumber;
@property (nonatomic, assign) BOOL isVacant;

- (instancetype)initWithUnitNumber:(int)unitNumber isVacant:(BOOL)isVacant;

@end
