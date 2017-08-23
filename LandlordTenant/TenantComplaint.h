//
//  TenantComplaint.h
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-21.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ComplaintType) {
    maintenance = 1,
    noise = 2,
    general = 3
};

@interface TenantComplaint : NSObject

//@property (nonatomic, strong) enum complaintType;
@property (nonatomic, strong) NSString* complaintDescription;
@property (nonatomic, strong) NSDate* date;
@property (nonatomic, assign) ComplaintType type;

- (instancetype)initWithType:(ComplaintType)type date:(NSDate*)date description:(NSString*)complaintDescription;

@end
