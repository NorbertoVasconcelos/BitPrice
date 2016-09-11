//
//  BitcoinPrice.swift
//  BitPrice
//
//  Created by Norberto Vasconcelos on 09/09/16.
//  Copyright © 2016 Norberto Vasconcelos. All rights reserved.
//

import UIKit
import ObjectMapper

struct BitcoinPrice: Mappable {
    
    var bpi: BitCurrency?
    var disclaimer: String?
    var time: Time?
    
    init?(_ map: Map) {
    }
    
    mutating func mapping(map: Map) {
        bpi <- map["bpi.EUR"]
        disclaimer <- map["disclaimer"]
        time <- map["time"]
    }
}
