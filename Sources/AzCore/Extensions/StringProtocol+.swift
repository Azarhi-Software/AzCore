//
//  StringProtocol.swift
//  AzCore
//
//  Created by Jon Flowers on 1/21/23.
//

import Foundation


public extension StringProtocol
{
    var html2AttributedString: NSAttributedString?
    {
        Data(utf8).html2AttributedString
    }
    
    var html2String: String
    {
        html2AttributedString?.string ?? ""
    }
}
