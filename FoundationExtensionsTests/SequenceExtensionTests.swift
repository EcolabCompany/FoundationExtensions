import XCTest
import FoundationExtensions


private struct EquatableTest: Equatable {

    var value: String

}

private func == (left: EquatableTest, right: EquatableTest) -> Bool {
    return left.value == right.value
}


private struct HashableTest {

    var value: String

}

extension HashableTest: Hashable {

    var hash: Int {
        return value.hash
    }

}

private func == (left: HashableTest, right: HashableTest) -> Bool {
    return left.value == right.value
}


class SequenceExtensionTests: XCTestCase {

    func test_unique_filtersOutDuplicatesForEquatable() {
        let array = [EquatableTest(value: "Value1"), EquatableTest(value: "Value2"), EquatableTest(value: "Value2"), EquatableTest(value: "Value3")]

        let uniqueArray = array.unique()

        XCTAssertEqual(uniqueArray.count, 3)

        let uniqueValues = uniqueArray.map(\.value)
        XCTAssertTrue(uniqueValues.contains("Value1"))
        XCTAssertTrue(uniqueValues.contains("Value2"))
        XCTAssertTrue(uniqueValues.contains("Value3"))
    }


    func test_unique_filtersOutDuplicatesForHashable() {
        let array = [HashableTest(value: "Value1"), HashableTest(value: "Value2"), HashableTest(value: "Value2"), HashableTest(value: "Value3")]

        let uniqueArray = array.unique()

        XCTAssertEqual(uniqueArray.count, 3)

        let uniqueValues = uniqueArray.map { return $0.value }
        XCTAssertTrue(uniqueValues.contains("Value1"))
        XCTAssertTrue(uniqueValues.contains("Value2"))
        XCTAssertTrue(uniqueValues.contains("Value3"))
    }
    
    
    func test_uniqueBy_filtersOutDuplicatesKeepingOrdering() {
        let array = [HashableTest(value: "Value2"), HashableTest(value: "Value3"), HashableTest(value: "Value1"), HashableTest(value: "Value3")]

        let uniqueArray = array.unique(by: \.value)

        XCTAssertEqual(uniqueArray.count, 3)

        let uniqueValues = uniqueArray.map(\.value)
        XCTAssertTrue(uniqueValues[0] == "Value2")
        XCTAssertTrue(uniqueValues[1] == "Value3")
        XCTAssertTrue(uniqueValues[2] == "Value1")
    }


    func test_contains() {
        let numbers = [1, 2, 3, 4, 5]

        XCTAssertTrue(numbers.contains({ $0 == 1 }))
        XCTAssertFalse(numbers.contains({ $0 == 6 }))
    }

    
    func test_toDictionary() {
        let array = ["A", "AA", "B", "BB"]
        let dic = array.toDictionary(by: { $0.first! })
        XCTAssertEqual(dic, ["A" : ["A", "AA"], "B" : ["B", "BB"]])
    }
}
