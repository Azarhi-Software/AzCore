//
//  Int+.swift
//  
//
//  Created by Jon Flowers on 3/2/22.
//

import Foundation


public extension Int
{
    static func random(_ lower: Int = 0, _ upper: Int = 100) -> Int
    {
        return Int.random(in: lower...upper)
    }
}

public extension Int
{
    /// Check if the value is even or not.
    var isEven: Bool { self.isMultiple(of: 2) }
    /// Check if the value is odd or not.
    var isOdd: Bool { !isEven }
    /// Check if the value is positive or not.
    var isPositive: Bool { self > 0 }
    /// Check if the value is negative or not.
    var isNegative: Bool { !isPositive }
    /// Create a range from 0 to the current value.
    var range: Range<Int> { 0..<self }
    
    /// Returns the number of digits this number.
    var digits: Int
    {
        if self == 0 {
            return 1
        }
        return Int(log10(fabs(Double(self)))) + 1
    }
}

public extension Int
{
    /// Round the current value to the nearest tens.
    var nearestTens: Int { nearest(to: 10) }
    /// Round the current value to the nearest dozens.
    var nearestDozens: Int { nearest(to: 12) }
    /// Round the current value to the nearest hundreds.
    var nearestHundreds: Int { nearest(to: 100) }
    /// Round the current value to the nearest thousands.
    var nearestThousands: Int { nearest(to: 1000) }
    
    /// Caclulate the nearest below value for this number in comparison with a specified value.
    /// - Parameter value: The value that will be used to search the nearest up.
    /// - Returns: The nearest value to the speficied value.
    func nearest(to value: Int) -> Int
    {
        self / value * value + (self % value) / (value / 2) * value
    }
}



public extension Int32
{
    /// - note: Using `Int` as parameter type as we usually just want to write `Int32.random(13, 37)` and not `Int32.random(Int32(13), Int32(37))`
    static func random(_ lower: Int = 0, _ upper: Int = 100) -> Int32
    {
        return Int32.random(in: Int32(lower)...Int32(upper))
    }
}
