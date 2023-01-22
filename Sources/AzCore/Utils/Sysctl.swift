//
//  AzHwInfo.swift
//  
//
//  Created by Jon Flowers on 11/24/22.
//

import Foundation


public struct Sysctl
{
    /// Possible errors.
    public enum Error: Swift.Error
    {
        case unknown
        case malformedUTF8
        case invalidSize
        case posixError(POSIXErrorCode)
    }
    
    public static func integer(for name: String) -> Int
    {
        var size = 0
        sysctlbyname(name, nil, &size, nil, 0)
        var value = [CChar](repeating: 0,  count: size)
        sysctlbyname(name, &value, &size, nil, 0)
        return Int(value[0])
    }
    
    
    public static func string(for name: String) -> String
    {
        var size = 0
        sysctlbyname(name, nil, &size, nil, 0)
        var value = [CChar](repeating: 0,  count: size)
        sysctlbyname(name, &value, &size, nil, 0)
        return String(cString: value)
    }
    
    public static var totalCores: Int { return Sysctl.integer(for: "hw.ncpu") }
    
    public static var performanceCores: Int { return Sysctl.integer(for: "hw.perflevel0.physicalcpu") }
    
    public static var efficiencyCores: Int { return Sysctl.integer(for: "hw.perflevel1.physicalcpu") }

    public static var hardware: String { return Sysctl.string(for: "hw.machine") }
}
