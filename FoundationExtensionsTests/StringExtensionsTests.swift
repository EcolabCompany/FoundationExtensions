import XCTest
import FoundationExtensions


class StringExtensionsTests: XCTestCase {

    func test_trimCharactersFromFront() {
        let expected = "bar"
        let target = "foobar"
        let chars: [Character] = ["f", "o", "o"]
        let actual = target.trimCharactersFromFront(chars)
        XCTAssertEqual(expected, actual)
    }

    func test_trimCharactersFromEnd() {
        let expected = "foo"
        let target = "foobar"
        let chars: [Character] = ["b", "a", "r"]
        let actual = target.trimCharactersFromEnd(chars)
        XCTAssertEqual(expected, actual)
    }

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
