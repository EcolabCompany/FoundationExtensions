import XCTest
import FoundationExtensions


class NSNumberExtensionTests: XCTestCase {

    var number1: NSNumber!
    var number2: NSNumber!


    override func setUp() {
        super.setUp()
        number1 = NSNumber(value: arc4random())
        number2 = NSNumber(value: arc4random())
    }


    func test_addition() {
        XCTAssertEqual(number1 + number2, NSNumber(value: number1.floatValue + number2.floatValue))
    }


    func test_subtraction() {
        XCTAssertEqual(number1 - number2, NSNumber(value: number1.floatValue - number2.floatValue))
    }


    func test_greaterThan() {
        XCTAssertEqual(number1 > number2, number1.compare(number2) == .orderedDescending)
    }


    func test_lessThan() {
        XCTAssertEqual(number1 < number2, number1.compare(number2) == .orderedAscending)
    }


    func test_equals() {
        XCTAssertEqual(number1 == number2, number1.isEqual(to: number2))
        XCTAssertEqual(number1 == number1, number1.isEqual(to: number1))
    }


    func test_greaterThanOrEqual() {
        let expectedResult = number1.compare(number2) == .orderedSame
            || number1.compare(number2) == .orderedDescending
        XCTAssertEqual(number1 >= number2, expectedResult)
    }


    func test_lessThanOrEqual() {
        let expectedResult = number1.compare(number2) == .orderedSame
            || number1.compare(number2) == .orderedAscending
        XCTAssertEqual(number1 <= number2, expectedResult)
    }


    func test_add_int() {
        let int = 42
        XCTAssertEqual(number1 + int, NSNumber(value: number1.intValue + int))
    }

}
