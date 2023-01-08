//
//  String+.swift
//  
//
//  Created by Jon Flowers on 2/24/22.
//

import Foundation


public extension String
{
    func toURL() -> URL
    {
        return URL(string: self)!
    }
    
    func fileName(withExtensiton: Bool = true) -> String
    {
        let url = URL(fileURLWithPath: self)
        
        if withExtensiton
        {
            return url.lastPathComponent
        }
        else
        {
            return url.deletingPathExtension().lastPathComponent
        }
    }
    
    func fileExtension() -> String
    {
        return URL(fileURLWithPath: self).pathExtension
    }
    
    func extractURLs() -> [URL]
    {
        var urls : [URL] = []
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            detector.enumerateMatches(in: self, options: [], range: NSMakeRange(0, self.count), using: { (result, _, _) in
                if let match = result, let url = match.url
                {
                    urls.append(url)
                }
            })
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return urls
    }
    
    func extractEmailAddrIn(text: String) -> [String]
    {
        var results = [String]()
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let nsText = self as NSString
        do {
            let regExp = try NSRegularExpression(pattern: emailRegex, options: .caseInsensitive)
            let range = NSMakeRange(0, text.count)
            let matches = regExp.matches(in: text, options: .reportProgress, range: range)
            
            for match in matches {
                let matchRange = match.range
                results.append(nsText.substring(with: matchRange))
            }
        } catch (let error) {
            print(error)
        }
        
        return results
    }
}


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
