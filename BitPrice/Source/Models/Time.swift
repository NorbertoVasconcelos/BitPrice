//
//  Time.swift
//  BitPrice
//
//  Created by Norberto Vasconcelos on 11/09/16.
//  Copyright © 2016 Norberto Vasconcelos. All rights reserved.
//

import UIKit
import ObjectMapper

struct Time: Mappable {
    
    var updatedISO: String?
    var updated: String?
    var updateduk: String?
    
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        updatedISO <- map["updatedISO"]
        updated <- map["updated"]
        updateduk <- map["updateduk"]
    }
}
