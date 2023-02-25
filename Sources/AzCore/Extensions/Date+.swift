//
//  Date+.swift
//  
//
//  Created by Jon Flowers on 2/25/23.
//

import Foundation


extension Date
{
    /// Get number of seconds between two date
    ///
    /// - Parameter date: date to compare self to.
    /// - Returns: number of seconds between self and given date.
    func secondsSince(_ date: Date) -> Double
    {
        return timeIntervalSince(date)
    }
    
    /// Get number of minutes between two date
    ///
    /// - Parameter date: date to compare self to.
    /// - Returns: number of minutes between self and given date.
    func minutesSince(_ date: Date) -> Double
    {
        return timeIntervalSince(date) / 60
    }
    
    /// Get number of hours between two date
    ///
    /// - Parameter date: date to compare self to.
    /// - Returns: number of hours between self and given date.
    func hoursSince(_ date: Date) -> Double
    {
        return timeIntervalSince(date) / 3600
    }
    
    /// Get number of days between two date
    ///
    /// - Parameter date: date to compare self to.
    /// - Returns: number of days between self and given date.
    func daysSince(_ date: Date) -> Double
    {
        return timeIntervalSince(date) / (3600 * 24)
    }
}
