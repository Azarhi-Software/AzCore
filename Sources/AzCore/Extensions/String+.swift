//
//  String+.swift
//  AzCore
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
    
    var isValidEmail: Bool
    {
        // http://emailregex.com/
        let regex =
        "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}


public extension String
{
    var base64Decoded: String?
    {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters)
        {
            return String(data: data, encoding: .utf8)
        }
        
        let remainder = count % 4
        
        var padding = ""
        if remainder > 0
        {
            padding = String(repeating: "=", count: 4 - remainder)
        }
        
        guard let data = Data(base64Encoded: self + padding, options: .ignoreUnknownCharacters) else { return nil }
        
        return String(data: data, encoding: .utf8)
    }
    
    var base64Encoded: String?
    {
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
}


public extension String
{
    var containEmoji: Bool
    {
        for scalar in unicodeScalars
        {
            switch scalar.value
            {
                case 0x1F600...0x1F64F, // Emoticons
                    0x1F300...0x1F5FF, // Misc Symbols and Pictographs
                    0x1F680...0x1F6FF, // Transport and Map
                    0x1F1E6...0x1F1FF, // Regional country flags
                    0x2600...0x26FF, // Misc symbols
                    0x2700...0x27BF, // Dingbats
                    0xE0020...0xE007F, // Tags
                    0xFE00...0xFE0F, // Variation Selectors
                    0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
                    127_000...127_600, // Various asian characters
                    65024...65039, // Variation selector
                    9100...9300, // Misc items
                    8400...8447: // Combining Diacritical Marks for Symbols
                    return true
                default:
                    continue
            }
        }
        return false
    }
    
    var bool: Bool?
    {
        let selfLowercased = trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        switch selfLowercased
        {
            case "true", "yes", "1":
                return true
            case "false", "no", "0":
                return false
            default:
                return nil
        }
    }
}


public extension String
{
    @discardableResult
    mutating func trim() -> String
    {
        self = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return self
    }
    
    @discardableResult
    mutating func padStart(_ length: Int, with string: String = " ") -> String
    {
        self = paddingStart(length, with: string)
        return self
    }
    
    
    func paddingStart(_ length: Int, with string: String = " ") -> String
    {
        guard count < length else { return self }
        
        let padLength = length - count
        if padLength < string.count
        {
            return string[string.startIndex..<string.index(string.startIndex, offsetBy: padLength)] + self
        }
        else
        {
            var padding = string
            while padding.count < padLength
            {
                padding.append(string)
            }
            return padding[padding.startIndex..<padding.index(padding.startIndex, offsetBy: padLength)] + self
        }
    }
    
    @discardableResult
    mutating func padEnd(_ length: Int, with string: String = " ") -> String
    {
        self = paddingEnd(length, with: string)
        return self
    }
    
    func paddingEnd(_ length: Int, with string: String = " ") -> String
    {
        guard count < length else { return self }
        
        let padLength = length - count
        if padLength < string.count
        {
            return self + string[string.startIndex..<string.index(string.startIndex, offsetBy: padLength)]
        }
        else
        {
            var padding = string
            while padding.count < padLength
            {
                padding.append(string)
            }
            return self + padding[padding.startIndex..<padding.index(padding.startIndex, offsetBy: padLength)]
        }
    }
    
    func removingPrefix(_ prefix: String) -> String
    {
        guard hasPrefix(prefix) else { return self }
        return String(dropFirst(prefix.count))
    }

    func removingSuffix(_ suffix: String) -> String
    {
        guard hasSuffix(suffix) else { return self }
        return String(dropLast(suffix.count))
    }
    
    func withPrefix(_ prefix: String) -> String
    {
        guard !hasPrefix(prefix) else { return self }
        return prefix + self
    }
}


public extension String // Testing
{
    static func loremIpsum(ofLength length: Int = 445) -> String
    {
        guard length > 0 else { return "" }
        
        // https://www.lipsum.com/
        let loremIpsum = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        """
        if loremIpsum.count > length
        {
            return String(loremIpsum[loremIpsum.startIndex..<loremIpsum.index(loremIpsum.startIndex, offsetBy: length)])
        }
        return loremIpsum
    }
}
