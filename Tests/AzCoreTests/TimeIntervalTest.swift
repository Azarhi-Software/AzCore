//
//  TimeIntervalTest.swift
//  
//
//  Created by Jon Flowers on 2/25/23.
//

import XCTest

final class TimeIntervalTest: XCTestCase
{
    override func setUpWithError() throws
    {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntervalToString() throws
    {
        // 1677356535
        // 1677360870
        let interval: TimeInterval = 1677360870 - 1677356535
        XCTAssertEqual(interval, 4335)
        let timeString = interval.asString()
        XCTAssertEqual(timeString, "01h : 12m : 15s")
    }

}
