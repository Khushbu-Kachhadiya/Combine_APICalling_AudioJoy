//
//  DateExtensions.swift
//  Audiojoy
//
//  Created by Tung Fam on 6/26/18.
//  Copyright © 2018 Pitashi. All rights reserved.
//

import Foundation

extension Date {

    /// Example: "9:33 AM"
    var formattedTimeShort: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }

    var timeRemoved: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.date(from: dateFormatter.string(from: self))
    }

    func dateByAdding(component: Calendar.Component = .day, value: Int) -> Date {
        return Calendar.current.date(byAdding: component, value: value, to: self)!
    }

    /// Returns a date with changed time components (hour, minute) taken from `date` argument time components
    func changeDateByUsingTimeComponents(from timeDate: Date, calendar: Calendar) -> Date? {
        var mainDateComponents = calendar.dateComponents([.year, .month, .day], from: self)
        let timeDateComponents = calendar.dateComponents([.hour, .minute], from: timeDate)
        mainDateComponents.hour = timeDateComponents.hour
        mainDateComponents.minute = timeDateComponents.minute
        return calendar.date(from: mainDateComponents)
    }
    
    
    func dateComponentsUsingTimeComponents(from timeDate: Date, calendar: Calendar) -> DateComponents {
        var mainDateComponents = calendar.dateComponents([.year, .month, .day], from: self)
        let timeDateComponents = calendar.dateComponents([.hour, .minute], from: timeDate)
        mainDateComponents.hour = timeDateComponents.hour
        mainDateComponents.minute = timeDateComponents.minute
        return mainDateComponents
    }


}
