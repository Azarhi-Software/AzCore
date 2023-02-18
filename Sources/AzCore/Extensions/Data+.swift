//
//  Data+.swift
//  AzCore
//
//  Created by Jon Flowers on 2/25/22.
//

import Foundation
#if os(OSX)
import AppKit
#elseif os(iOS)
import UIKit
#endif


extension Data
{
    var html2AttributedString: NSAttributedString?
    {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
}
