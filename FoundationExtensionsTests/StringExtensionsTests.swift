import XCTest
import FoundationExtensions


class StringExtensionsTests: XCTestCase {

    func test_trimNewLines() {
        let expected = "foobar"
        let target = "foobar\n\n"
        let actual = target.trimNewLines()
        XCTAssertEqual(expected, actual)
    }

    func test_trimWhiteSpace() {
        let expected = "foobar"
        let target = "    foobar  "
        let actual = target.trimWhiteSpace()
        XCTAssertEqual(expected, actual)
    }

}
