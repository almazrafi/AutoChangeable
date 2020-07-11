#if canImport(CoreGraphics)
import CoreGraphics
import XCTest

@testable import AutoChangeable

class CGSizeChangingTests: XCTestCase {

    func testThatInstanceCanBeCopiedWithoutChanges() {
        let expectedSize = CGSize(width: 123, height: 456)
        let size = expectedSize

        let newSize = size.changing { _ in }

        XCTAssertEqual(newSize, expectedSize)
    }

    func testThatInstanceCanBeCopiedWithChanges() {
        let expectedSize = CGSize(width: 12, height: 34)
        let size = CGSize(width: 56, height: 34)

        let newSize = size.changing { newSize in
            newSize.width = expectedSize.width
        }

        XCTAssertEqual(newSize, expectedSize)
    }
}

#endif
