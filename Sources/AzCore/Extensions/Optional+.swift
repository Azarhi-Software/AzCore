//
//  Optional+.swift
//  AzCore
//
//  Created by Jon Flowers on 1/22/23.
//

import Foundation


public extension Optional
{
    func unwrapped(or defaultValue: Wrapped) -> Wrapped
    {
        // http://www.russbishop.net/improving-optionals
        return self ?? defaultValue
    }
    
    func unwrapped(or error: Error) throws -> Wrapped
    {
        guard let wrapped = self else { throw error }
        return wrapped
    }
    
    ///        let bar: String? = "bar"
    ///        bar.run { unwrappedBar in
    ///            // block will run since bar is not nil
    ///            print(unwrappedBar) -> "bar"
    ///        }
    func run(_ block: (Wrapped) -> Void)
    {
        // http://www.russbishop.net/improving-optionals
        _ = map(block)
    }
    
    /// Assign an optional value to a variable only if the value is not nil.
    static func ??= (lhs: inout Optional, rhs: Optional)
    {
        guard let rhs = rhs else { return }
        lhs = rhs
    }
    
    /// Assign an optional value to a variable only if the variable is nil.
    ///
    ///     var someText: String? = nil
    ///     let newText = "Foo"
    ///     let defaultText = "Bar"
    ///     someText ?= newText // someText is now "Foo" because it was nil before
    ///     someText ?= defaultText // someText doesn't change its value because it's not nil
    ///
    /// - Parameters:
    ///   - lhs: Any?
    ///   - rhs: Any?
    static func ?= (lhs: inout Optional, rhs: @autoclosure () -> Optional)
    {
        if lhs == nil
        {
            lhs = rhs()
        }
    }
}

public extension Optional where Wrapped: Collection
{
    /// Check if optional is nil or empty collection.
    var isNilOrEmpty: Bool
    {
        guard let collection = self else { return true }
        return collection.isEmpty
    }
    
    /// Returns the collection only if it is not nil and not empty.
    var nonEmpty: Wrapped?
    {
        guard let collection = self else { return nil }
        guard !collection.isEmpty else { return nil }
        return collection
    }
}

public extension Optional where Wrapped: RawRepresentable, Wrapped.RawValue: Equatable
{
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable static func == (lhs: Optional, rhs: Wrapped.RawValue?) -> Bool
    {
        return lhs?.rawValue == rhs
    }
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable static func == (lhs: Wrapped.RawValue?, rhs: Optional) -> Bool
    {
        return lhs == rhs?.rawValue
    }
    
    /// Returns a Boolean value indicating whether two values are not equal.
    ///
    /// Inequality is the inverse of equality. For any values `a` and `b`,
    /// `a != b` implies that `a == b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable static func != (lhs: Optional, rhs: Wrapped.RawValue?) -> Bool
    {
        return lhs?.rawValue != rhs
    }
    
    /// Returns a Boolean value indicating whether two values are not equal.
    ///
    /// Inequality is the inverse of equality. For any values `a` and `b`,
    /// `a != b` implies that `a == b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable static func != (lhs: Wrapped.RawValue?, rhs: Optional) -> Bool
    {
        return lhs != rhs?.rawValue
    }
}


infix operator ??=: AssignmentPrecedence
infix operator ?=: AssignmentPrecedence
