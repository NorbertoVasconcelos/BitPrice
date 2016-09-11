//
//  NSDate+Utils.swift
//  BitPrice
//
//  Created by Norberto Vasconcelos on 11/09/16.
//  Copyright © 2016 Norberto Vasconcelos. All rights reserved.
//

import Foundation
import UIKit

extension NSDate {
    class func dateByAddingDays(days: Int) -> NSDate {
        return self.days(days)
    }
    
    class func dateBySubstractingDays(days: Int) -> NSDate {
        return NSDate.days(-days)
    }
}

extension NSDate {
    class func days(days:Int) -> NSDate {
        return NSCalendar.currentCalendar().dateByAddingUnit( [.Day], value: days, toDate: NSDate(), options: [] )!
    }
}

extension NSDate {
    
    class func dateAtPrevMidnight() -> NSDate? {
        
        let date                = NSDate.dateBySubstractingDays(1)
        let calendar            = NSCalendar.currentCalendar()
        let components          = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: date)
        
        // Specify date components
        let dateComponents      = NSDateComponents()
        dateComponents.year     = components.year
        dateComponents.month    = components.month
        dateComponents.day      = components.day
        dateComponents.timeZone = NSTimeZone(name: "UTC")
        dateComponents.hour     = 0
        dateComponents.minute   = 0
        dateComponents.second   = 0
        
        // Create date from components
        let userCalendar    = NSCalendar.currentCalendar()
        let dateTime        = userCalendar.dateFromComponents(dateComponents)
        
        return dateTime
    }
}
