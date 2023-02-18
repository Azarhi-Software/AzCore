//
//  FixedWidthInteger+.swift
//  
//
//  Created by Jon Flowers on 2/12/23.
//

import Foundation


extension FixedWidthInteger
{
    public var byteWidth: Int
    {
        return self.bitWidth/UInt8.bitWidth
    }
    
    public static var byteWidth: Int
    {
        return Self.bitWidth/UInt8.bitWidth
    }
}
