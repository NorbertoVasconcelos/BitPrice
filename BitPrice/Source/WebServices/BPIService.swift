//
//  BPIService.swift
//  BitPrice
//
//  Created by Norberto Vasconcelos on 11/09/16.
//  Copyright © 2016 Norberto Vasconcelos. All rights reserved.
//

import Moya

enum BPIService {
    case getCurrentPrice()
    case getHistoricalData()
    case getHistoricalWithDates(String, String)
}

extension BPIService : TargetType {
    
    var baseURL: NSURL {return NSURL(string: "https://api.coindesk.com/v1/bpi")!}

    var path: String {
        switch self{
        case .getCurrentPrice():
            return "/currentprice.json"
        case .getHistoricalData():
            return "/historical/close.json"
        case .getHistoricalWithDates(_,_):
            return "/historical/close.json"
        }
    }
    
    var method: Moya.Method {
        switch self{
        default:
            return .GET
        }
    }
    
    var parameters: [String : AnyObject]?{
        switch self{
        case .getHistoricalWithDates(let start, let end):
            return ["start": start,
                    "end": end]
        default:
            return nil
        }
    }
    
    var sampleData: NSData {
        switch self {
        default:
            return "".dataUsingEncoding(NSUTF8StringEncoding)!;
        }
    }

    
    var multipartBody: [MultipartFormData]? {
        return nil
    }
}
