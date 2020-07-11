import XCTest

@testable import AutoChangeable

class ArrayChangingTests: XCTestCase {

    func testThatInstanceCanBeCopiedWithoutChanges() {
        let expectedCollection = [1, 2, 3]
        let collection = expectedCollection

        let newCollection = collection.changing { _ in }

        XCTAssertEqual(newCollection, expectedCollection)
    }

    func testThatInstanceCanBeCopiedWithChanges() {
        let expectedCollection = [1, 2]
        let collection = [4, 5, 6]

        let newCollection = collection.changing { newCollection in
            newCollection[0] = expectedCollection[0]
            newCollection[1] = expectedCollection[1]
            newCollection.remove(at: 2)
        }

        XCTAssertEqual(newCollection, expectedCollection)
    }

    func testThatInstanceCanBeCopiedWithNestedChanges() {
        let expectedCollection: [Company] = [.apple, .next]
        let collection: [Company] = [.noname, .next]

        let newCollection = collection.changing { newCollection in
            newCollection[changing: 0].name = expectedCollection[0].name
            newCollection[changing: 0].country = expectedCollection[0].country
        }

        XCTAssertEqual(newCollection, expectedCollection)
    }

    func testThatInstanceCanBeCopiedWhenItIsNested() {
        struct Foobar: Changeable, Equatable {
            let list: [Company]

            init(list: [Company]) {
                self.list = list
            }

            init(copy: ChangeableWrapper<Self>) {
                self.init(list: copy.list)
            }
        }

        let expectedFoobar = Foobar(list: [.apple, .next])
        let foobar = Foobar(list: [.noname, .next])

        let newFoobar = foobar.changing { newFoobar in
            newFoobar.list[changing: 0].name = expectedFoobar.list[0].name
            newFoobar.list[changing: 0].country = expectedFoobar.list[0].country
        }

        XCTAssertEqual(newFoobar, expectedFoobar)
    }
}
