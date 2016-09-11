//
//  String+Html.swift
//  BitPrice
//
//  Created by Norberto Vasconcelos on 11/09/16.
//  Copyright © 2016 Norberto Vasconcelos. All rights reserved.
//

import UIKit

extension String {
    var html2String: String? {
        guard let data = dataUsingEncoding(NSUTF8StringEncoding) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding], documentAttributes: nil).string
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    var unicodes:[UInt32] {
        return unicodeScalars.map{$0.value}
    }
}