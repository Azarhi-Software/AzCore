//
//  StringExtensionTest.swift
//  
//
//  Created by Jon Flowers on 3/3/22.
//

import XCTest

class StringExtensionTest: XCTestCase
{
    override func setUpWithError() throws
    {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFileName() throws
    {
        let n1 = "/Users/jflow/Documents/testfile.txt".fileName()
        XCTAssertEqual(n1, "testfile.txt")
        
        let n2 = "/Users/jflow/Documents/testfile.txt".fileName(withExtensiton: false)
        XCTAssertEqual(n2, "testfile")
    }

    func testFileExtension() throws
    {
        XCTAssertEqual("/Users/jflow/Documents/testfile.txt".fileExtension(), "txt")
    }
}
