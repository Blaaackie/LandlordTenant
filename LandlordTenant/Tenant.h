//
//  Tenant.h
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tenant : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *unitNumber;

-(instancetype) initWithName:(NSString*)name phoneNumber:(NSString*)phoneNumber unitNumber:(NSString*)unitNumber;

@end
