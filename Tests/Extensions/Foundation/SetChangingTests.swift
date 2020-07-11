import XCTest

@testable import AutoChangeable

class SetChangingTests: XCTestCase {

    func testThatInstanceCanBeCopiedWithoutChanges() {
        let expectedCollection: Set<Int> = [1, 2, 3]
        let collection = expectedCollection

        let newCollection = collection.changing { _ in }

        XCTAssertEqual(newCollection, expectedCollection)
    }

    func testThatInstanceCanBeCopiedWithChanges() {
        let expectedCollection: Set<Int> = [1, 2]
        let collection: Set<Int> = [4, 5, 6]

        let newCollection = collection.changing { newCollection in
            newCollection.removeAll()

            expectedCollection.forEach { newCollection.insert($0) }
        }

        XCTAssertEqual(newCollection, expectedCollection)
    }
}
