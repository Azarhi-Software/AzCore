//
//  URL+.swift
//  AzCore
//
//  Created by Jon Flowers on 11/19/22.
//

import Foundation


public extension URL
{
    /// Returns an array of immediate child urls, without recursing deep into the file hierarchy
    public var contentsOfDirectory: [URL]
    {
        (try? FileManager.default.contentsOfDirectory(
            at: self,
            includingPropertiesForKeys: nil,
            options: [.producesRelativePathURLs, .skipsHiddenFiles]
        )) ?? []
    }
    
    public var isDirectory: Bool
    {
        (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
    }
}

public extension URL: Identifiable
{
    public var id: String
    {
        self.path
    }
}
