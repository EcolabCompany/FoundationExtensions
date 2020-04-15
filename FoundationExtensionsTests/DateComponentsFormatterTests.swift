import XCTest
import FoundationExtensions


class DateComponentsFormatterTests: XCTestCase {

    func test_init() {
        let formatter = DateComponentsFormatter(style: .short)
        XCTAssertEqual(formatter.unitsStyle, .short)
    }


    func test_string_fromMinutes_Int() {
        let formatter = DateComponentsFormatter(style: .short)
        let time = formatter.string(minutes: 66)
        XCTAssertEqual(time, "1 hr, 6 min")
    }


    func test_string_fromMinutes_Double() {
        let formatter = DateComponentsFormatter(style: .short)
        let time = formatter.string(minutes: 66.6)
        XCTAssertEqual(time, "1 hr, 6 min, 35 sec")
    }
}
