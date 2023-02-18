//
//  FixedWidthIntegerTests.swift
//  
//
//  Created by Jon Flowers on 2/12/23.
//

import XCTest

final class FixedWidthIntegerTests: XCTestCase
{
    func testSizeOf() throws
    {
        XCTAssertEqual(Int.byteWidth, MemoryLayout<Int>.size)
        XCTAssertEqual(UInt.byteWidth, MemoryLayout<UInt>.size)
        XCTAssertEqual(Int32.byteWidth, MemoryLayout<Int32>.size)
        XCTAssertEqual(UInt32.byteWidth, MemoryLayout<UInt32>.size)
    }
    
}
