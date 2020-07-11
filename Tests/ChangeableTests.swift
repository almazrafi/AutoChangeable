import XCTest

@testable import ChangeableCopy

class ChangeableTests: XCTestCase {

    // MARK: - Instance Methods

    func testThatInstanceCanBeCopiedWithoutChanges() {
        let expectedCompany = Company.apple
        let company = Company.apple

        let newCompany = company.changing { _ in }

        XCTAssertEqual(newCompany, expectedCompany)
    }

    func testThatInstanceCanBeCopiedWithChanges() {
        let expectedCompany = Company.next
        let company = Company.noname

        let newCompany = company.changing { newCompany in
            newCompany.name = expectedCompany.name
            newCompany.country = expectedCompany.country
        }

        XCTAssertEqual(newCompany, expectedCompany)
    }
}
