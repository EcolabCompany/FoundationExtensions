import XCTest
import FoundationExtensions

class DoubleExtensionsTests: XCTestCase {

  func test_limit() {
    let expected = 12345.12
    let target = 12345678.123455
    let actual = target.limit(intLength: 5, decimalLength: 2)
    XCTAssertEqual(expected, actual)
  }

}
