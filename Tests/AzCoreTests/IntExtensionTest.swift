//
//  IntExtensionTest.swift
//  
//
//  Created by Jon Flowers on 3/2/22.
//

import XCTest

class IntExtensionTest: XCTestCase
{

    override func setUpWithError() throws
    {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOddEven() throws
    {
        XCTAssertTrue(2.isEven)
        XCTAssertFalse(2.isOdd)
        
        XCTAssertFalse(3.isEven)
        XCTAssertTrue(3.isOdd)
    }
    
    func testPosNeg() throws
    {
        XCTAssertTrue(2.isPositive)
        XCTAssertFalse(2.isNegative)
        
        let num = -2
        XCTAssertFalse(num.isPositive)
        XCTAssertTrue(num.isNegative)
    }
    
    func testRange() throws
    {
        let num = 100
        let range = num.range
        
        XCTAssertEqual(range, 0..<100)
    }
    
    func testDigits() throws
    {
        XCTAssertEqual(0.digits, 1)
        XCTAssertEqual(1.digits, 1)
        XCTAssertEqual(10.digits, 2)
        XCTAssertEqual(111.digits, 3)
        XCTAssertEqual(222.digits, 3)
        XCTAssertEqual(1111.digits, 4)
        XCTAssertEqual(12345.digits, 5)
        XCTAssertEqual(987654.digits, 6)
    }
    
    func testNearest() throws
    {
        XCTAssertEqual(32.nearestTens, 30)
        XCTAssertEqual(36.nearestTens, 40)
        XCTAssertEqual(32.nearestDozens, 36)
        XCTAssertEqual(29.nearestDozens, 24)
        XCTAssertEqual(29.nearestHundreds, 0)
        XCTAssertEqual(150.nearestHundreds, 200)
        XCTAssertEqual(120.nearestHundreds, 100)
        XCTAssertEqual(29.nearestThousands, 0)
        XCTAssertEqual(20009.nearestThousands, 20000)
        XCTAssertEqual(2009.nearestThousands, 2000)
        XCTAssertEqual(2.nearest(to: 30), 0)
        XCTAssertEqual(29.nearest(to: 30), 30)
        XCTAssertEqual(50.nearest(to: 30), 60)
    }
}
