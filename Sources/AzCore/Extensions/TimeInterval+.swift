//
//  TimeInterval+.swift
//  
//
//  Created by Jon Flowers on 2/25/23.
//

import Foundation


public extension TimeInterval
{
    func asString() -> String
    {
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600) % 24
        let days = (interval / 86400)
        
        var output = ""
        
        if days > 0 { output.append("\(days)D : ") }
        
        output.append("\(hours)h : \(minutes)m : \(seconds)s")
        return output
    }
}
