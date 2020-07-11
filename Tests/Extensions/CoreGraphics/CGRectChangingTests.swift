#if canImport(CoreGraphics)
import CoreGraphics
import XCTest

@testable import AutoChangeable

class CGRectChangingTests: XCTestCase {

    func testThatInstanceCanBeCopiedWithoutChanges() {
        let expectedRect = CGRect(
            origin: CGPoint(x: 12, y: 34),
            size: CGSize(width: 56, height: 78)
        )

        let rect = expectedRect

        let newRect = rect.changing { _ in }

        XCTAssertEqual(newRect, expectedRect)
    }

    func testThatInstanceCanBeCopiedWithChanges() {
        let expectedRect = CGRect(
            origin: CGPoint(x: 12, y: 34),
            size: CGSize(width: 56, height: 78)
        )

        let rect = CGRect(
            origin: CGPoint(x: 87, y: 65),
            size: CGSize(width: 56, height: 78)
        )

        let newRect = rect.changing { newRect in
            newRect.origin = expectedRect.origin
        }

        XCTAssertEqual(newRect, expectedRect)
    }

    func testThatInstanceCanBeCopiedWithNestedChanges() {
        let expectedRect = CGRect(
            origin: CGPoint(x: 12, y: 34),
            size: CGSize(width: 56, height: 78)
        )

        let rect = CGRect(
            origin: CGPoint(x: 87, y: 34),
            size: CGSize(width: 56, height: 21)
        )

        let newRect = rect.changing { newRect in
            newRect.origin.x = expectedRect.origin.x
            newRect.size.height = expectedRect.size.height
        }

        XCTAssertEqual(newRect, expectedRect)
    }
}

#endif
