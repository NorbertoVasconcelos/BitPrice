//
//  BitCurrency.swift
//  BitPrice
//
//  Created by Norberto Vasconcelos on 11/09/16.
//  Copyright © 2016 Norberto Vasconcelos. All rights reserved.
//

import UIKit
import ObjectMapper

struct BitCurrency: Mappable {
    
    var code: String?
    var symbol: String?
    var rate: String?
    var description: String?
    var rate_float: CGFloat?

    
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        symbol <- map["symbol"]
        rate <- map["rate"]
        description <- map["description"]
        rate_float <- map["rate_float"]
    }
}
