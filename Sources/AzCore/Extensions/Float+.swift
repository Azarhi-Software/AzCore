//
//  Float+.swift
//  
//
//  Created by Jon Flowers on 2/18/23.
//

import Foundation

#if canImport(CoreGraphics)
import CoreGraphics
#endif


public extension Float
{
    /// Int.
    var int: Int {
        return Int(self)
    }
    
    /// Double.
    var double: Double {
        return Double(self)
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
///   - lhs: base float.
///   - rhs: exponent float.
/// - Returns: exponentiation result (4.4 ** 0.5 = 2.0976176963).
public func ** (lhs: Float, rhs: Float) -> Float
{
    // http://nshipster.com/swift-operators/
    return pow(lhs, rhs)
}
