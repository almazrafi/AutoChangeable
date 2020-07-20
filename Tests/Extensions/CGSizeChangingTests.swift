#if canImport(CoreGraphics)
import CoreGraphics
import XCTest

@testable import ChangeableCopy

class CGSizeChangingTests: XCTestCase {

    // MARK: - Instance Methods

    func testThatInstanceCanBeCopiedWithoutChanges() {
        let expectedSize = CGSize(width: 123, height: 456)
        let size = expectedSize

        let newSize = size.changing { _ in }

        XCTAssertEqual(newSize, expectedSize)
    }

    func testThatInstanceCanBeCopiedWithChanges() {
        let expectedSize = CGSize(width: 12, height: 34)
        let size = CGSize(width: 56, height: 78)

        let newSize = size.changing { newSize in
            newSize.width = expectedSize.width
            newSize.height = expectedSize.height
        }

        XCTAssertEqual(newSize, expectedSize)
    }
}
#endif
