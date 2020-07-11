import XCTest

@testable import AutoChangeable

class DictionaryChangingTests: XCTestCase {

    func testThatInstanceCanBeCopiedWithoutChanges() {
        let expectedCollection = ["foo": "qwe", "bar": "asd"]
        let collection = expectedCollection

        let newCollection = collection.changing { _ in }

        XCTAssertEqual(newCollection, expectedCollection)
    }

    func testThatInstanceCanBeCopiedWithChanges() {
        let expectedCollection = ["foo": "qwe", "bar": "asd"]
        let collection = ["baz": "qwe"]

        let newCollection = collection.changing { newCollection in
            newCollection.removeAll()

            expectedCollection.forEach { newCollection[$0.key] = $0.value }
        }

        XCTAssertEqual(newCollection, expectedCollection)
    }
}
