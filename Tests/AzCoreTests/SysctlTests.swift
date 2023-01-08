import XCTest
@testable import AzCore

final class SysctlTests: XCTestCase
{
    func testHardware() throws
    {
        XCTAssertEqual(Sysctl.efficiencyCores, 4)
        XCTAssertEqual(Sysctl.performanceCores, 16)
        XCTAssertEqual(Sysctl.totalCores, 20)
        XCTAssertEqual(Sysctl.hardware, "arm64")
    }
}
