//
//  Int+.swift
//  AzCore
//
//  Created by Jon Flowers on 3/2/22.
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif

import Darwin


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
    var digitsCount: Int
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

public extension Int
{
    /// CountableRange 0..<Int.
    var countableRange: CountableRange<Int>
    {
        return 0..<self
    }
    
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
    
    /// UInt.
    var uInt: UInt
    {
        return UInt(self)
    }
    
    /// Double.
    var double: Double
    {
        return Double(self)
    }
    
    /// Float.
    var float: Float
    {
        return Float(self)
    }
    
#if canImport(CoreGraphics)
    /// CGFloat.
    var cgFloat: CGFloat
    {
        return CGFloat(self)
    }
#endif
    
    /// String formatted for values over ±1000 (example: 1k, -2k, 100k, 1kk, -5kk..).
    var kFormatted: String
    {
        var sign: String
        {
            return self >= 0 ? "" : "-"
        }
        let abs = Swift.abs(self)
        if abs == 0 {
            return "0k"
        } else if abs >= 0, abs < 1000 {
            return "0k"
        } else if abs >= 1000, abs < 1_000_000 {
            return String(format: "\(sign)%ik", abs / 1000)
        }
        return String(format: "\(sign)%ikk", abs / 100_000)
    }
    
//    /// Array of digits of integer value.
//    var digits: [Int] {
//        guard self != 0 else { return [0] }
//        var digits = [Int]()
//        var number = abs
//
//        while number != 0 {
//            let xNumber = number % 10
//            digits.append(xNumber)
//            number /= 10
//        }
//
//        digits.reverse()
//        return digits
//    }
}

// MARK: - Methods
public extension Int
{
    /// Check if given integer prime or not. Warning: Using big numbers can be computationally expensive!
    /// - Returns: true or false depending on prime-ness.
    func isPrime() -> Bool
    {
        // To improve speed on latter loop :)
        if self == 2 { return true }
        
        guard self > 1, self % 2 != 0 else { return false }
        
        // Explanation: It is enough to check numbers until
        // the square root of that number. If you go up from N by one,
        // other multiplier will go 1 down to get similar result
        // (integer-wise operation) such way increases speed of operation
        let base = Int(sqrt(Double(self)))
        for int in Swift.stride(from: 3, through: base, by: 2) where self % int == 0
        {
            return false
        }
        return true
    }
    
    /// Roman numeral string from integer (if applicable).
    ///
    ///     10.romanNumeral() -> "X"
    ///
    /// - Returns: The roman numeral string.
    func romanNumeral() -> String?
    {
        // https://gist.github.com/kumo/a8e1cb1f4b7cff1548c7
        guard self > 0 else { // there is no roman numeral for 0 or negative numbers
            return nil
        }
        let romanValues = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let arabicValues = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        
        var romanValue = ""
        var startingValue = self
        
        for (index, romanChar) in romanValues.enumerated()
        {
            let arabicValue = arabicValues[index]
            let div = startingValue / arabicValue
            for _ in 0..<div
            {
                romanValue.append(romanChar)
            }
            startingValue -= arabicValue * div
        }
        return romanValue
    }
    
    /// Rounds to the closest multiple of n.
    func roundToNearest(_ number: Int) -> Int
    {
        return number == 0 ? self : Int(round(Double(self) / Double(number))) * number
    }
}

// MARK: - Operators

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator **: PowerPrecedence
/// Value of exponentiation.
///
/// - Parameters:
///   - lhs: base integer.
///   - rhs: exponent integer.
/// - Returns: exponentiation result (example: 2 ** 3 = 8).
public func ** (lhs: Int, rhs: Int) -> Double
{
    // http://nshipster.com/swift-operators/
    return pow(Double(lhs), Double(rhs))
}

prefix operator √
/// Square root of integer.
///
/// - Parameter int: integer value to find square root for.
/// - Returns: square root of given integer.
public prefix func √ (int: Int) -> Double
{
    // http://nshipster.com/swift-operators/
    return sqrt(Double(int))
}

infix operator ±
/// Tuple of plus-minus operation.
///
/// - Parameters:
///   - lhs: integer number.
///   - rhs: integer number.
/// - Returns: tuple of plus-minus operation (example: 2 ± 3 -> (5, -1)).
public func ± (lhs: Int, rhs: Int) -> (Int, Int)
{

    return (lhs + rhs, lhs - rhs)
}

prefix operator ±
/// Tuple of plus-minus operation.
///
/// - Parameter int: integer number.
/// - Returns: tuple of plus-minus operation (example: ± 2 -> (2, -2)).
public prefix func ± (int: Int) -> (Int, Int)
{
    // http://nshipster.com/swift-operators/
    return (int, -int)
}

public extension Int32
{
    /// - note: Using `Int` as parameter type as we usually just want to write `Int32.random(13, 37)` and not `Int32.random(Int32(13), Int32(37))`
    static func random(_ lower: Int = 0, _ upper: Int = 100) -> Int32
    {
        return Int32.random(in: Int32(lower)...Int32(upper))
    }
}
