//
//  Landlord.h
//  LandlordTenant
//
//  Created by Elle Ti on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Landlord : NSObject
@property (nonatomic, strong) NSString *landlordName;

- (instancetype)initWithname:(NSString *)landlordName;

@end
