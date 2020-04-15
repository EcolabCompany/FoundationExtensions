import XCTest
import FoundationExtensions


class DateFormatterTests: XCTestCase {

    func test_init_with_dateFormat_and_timeZone() {
        let formatter = DateFormatter(dateFormat: "dateFormat", timeZone: TimeZone(abbreviation: "EST")!)

        XCTAssertEqual(formatter.dateFormat, "dateFormat")
        XCTAssertEqual(formatter.timeZone, TimeZone(abbreviation: "EST")!)
    }


    func test_init_dateStyle() {
        let formatter = DateFormatter(dateStyle: .short)
        XCTAssertEqual(formatter.dateStyle, .short)
    }


    func test_init_dateStyle_timeStyle() {
        let formatter = DateFormatter(dateStyle: .long, timeStyle: .full)
        XCTAssertEqual(formatter.dateStyle, .long)
        XCTAssertEqual(formatter.timeStyle, .full)
    }

}
