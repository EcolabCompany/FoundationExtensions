import XCTest
import FoundationExtensions


class DateTests: XCTestCase {

    func test_date_fromISO601String() {
        let string = "1970-01-01T00:00:00Z"

        let date = Date.date(fromISO601String: string)!

        
        XCTAssertNotNil(date)
        XCTAssertEqual(date.description, "1970-01-01 00:00:00 +0000")
    }


    func test_iso8601String() {
        let date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual(Date.iso8601String(from: date), "1970-01-01T00:00:00Z")
    }

}
