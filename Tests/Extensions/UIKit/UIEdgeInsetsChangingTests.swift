#if canImport(UIKit)
import UIKit
import XCTest

@testable import AutoChangeable

class UIEdgeInsetsChangingTests: XCTestCase {

    // MARK: - Instance Methods

    func testThatInstanceCanBeCopiedWithoutChanges() {
        let expectedInsets = UIEdgeInsets(
            top: 12.0,
            left: 34.0,
            bottom: 56.0,
            right: 78.0
        )

        let insets = expectedInsets

        let newInsets = insets.changing { _ in }

        XCTAssertEqual(newInsets, expectedInsets)
    }

    func testThatInstanceCanBeCopiedWithChanges() {
        let expectedInsets = UIEdgeInsets(
            top: 12.0,
            left: 34.0,
            bottom: 56.0,
            right: 78.0
        )

        let insets = UIEdgeInsets(
            top: 87.0,
            left: 65.0,
            bottom: 43.0,
            right: 21.0
        )

        let newInsets = insets.changing { newInsets in
            newInsets.top = expectedInsets.top
            newInsets.left = expectedInsets.left
            newInsets.bottom = expectedInsets.bottom
            newInsets.right = expectedInsets.right
        }

        XCTAssertEqual(newInsets, expectedInsets)
    }
}

#endif
