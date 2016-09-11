//
//  BitcoinPriceHistory.swift
//  BitPrice
//
//  Created by Norberto Vasconcelos on 11/09/16.
//  Copyright © 2016 Norberto Vasconcelos. All rights reserved.
//

import UIKit
import ObjectMapper

struct BitcoinPriceHistory: Mappable {
    
    var bpi: Dictionary<String, Float>?
    var disclaimer: String?
    var time: Time?
    
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        bpi <- map["bpi"]
        disclaimer <- map["disclaimer"]
        time <- map["time"]
    }
}
