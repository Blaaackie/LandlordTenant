//
//  Tenant.swift
//  LandlordTenant
//
//  Created by Tye Blackie on 2017-08-24.
//  Copyright © 2017 Tye Blackie. All rights reserved.
//

import Foundation

class Tenant{
    var name: String
    var phoneNumber: String
    var unitNumber: String
    
    init(with name: String, phoneNumber: String, and unitNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.unitNumber = unitNumber
    }
    
    
}

