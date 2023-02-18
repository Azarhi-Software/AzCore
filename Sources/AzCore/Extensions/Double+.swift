//
//  Double+.swift
//  
//
//  Created by Jon Flowers on 2/18/23.
//

import Foundation

#if canImport(CoreGraphics)
import CoreGraphics
#endif


public extension Double
{
    /// Radian value of degree input.
    var degreesToRadians: Double
    {
        return Double.pi * Double(self) / 180.0
    }
    
    /// Degree value of radian input.
    var radiansToDegrees: Double
    {
        return Double(self) * 180 / Double.pi
    }
}


public extension Double
{
    /// Int.
    var int: Int {
        return Int(self)
    }
    
    /// Float.
    var float: Float {
        return Float(self)
    }
    
#if canImport(CoreGraphics)
    /// CGFloat.
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
#endif
}

// MARK: - Operators
precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator **: PowerPrecedence
/// Value of exponentiation.
///
/// - Parameters:
///   - lhs: base double.
///   - rhs: exponent double.
/// - Returns: exponentiation result (example: 4.4 ** 0.5 = 2.0976176963).
public func ** (lhs: Double, rhs: Double) -> Double
{
    // http://nshipster.com/swift-operators/
    return pow(lhs, rhs)
}
