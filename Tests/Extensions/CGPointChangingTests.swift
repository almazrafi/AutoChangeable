#if canImport(CoreGraphics)
import CoreGraphics
import XCTest

@testable import AutoChangeable

class CGPointChangingTests: XCTestCase {

    func testThatInstanceCanBeCopiedWithoutChanges() {
        let expectedPoint = CGPoint(x: 123, y: 456)
        let point = expectedPoint

        let newPoint = point.changing { _ in }

        XCTAssertEqual(newPoint, expectedPoint)
    }

    func testThatInstanceCanBeCopiedWithChanges() {
        let expectedPoint = CGPoint(x: 12, y: 34)
        let point = CGPoint(x: 56, y: 78)

        let newPoint = point.changing { newPoint in
            newPoint.x = expectedPoint.x
            newPoint.y = expectedPoint.y
        }

        XCTAssertEqual(newPoint, expectedPoint)
    }
}

#endif
