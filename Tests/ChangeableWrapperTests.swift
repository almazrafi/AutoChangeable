import XCTest

@testable import AutoChangeable

class ChangeableWrapperTests: XCTestCase {

    // MARK: - Instance Methods

    func testThatPropertyCanBeChanged() {
        let expectedCompanyName = Company.next.name

        let company = Company.apple
        var companyCopy = ChangeableWrapper(company)

        companyCopy.name = expectedCompanyName

        XCTAssertEqual(companyCopy.name, expectedCompanyName)
        XCTAssertEqual(companyCopy.country, company.country)
    }

    func testThatOptionalPropertyCanBeChangedToValue() {
        let expectedCompanyCountry = Company.apple.country

        let company = Company.noname
        var companyCopy = ChangeableWrapper(company)

        companyCopy.country = expectedCompanyCountry

        XCTAssertEqual(companyCopy.name, company.name)
        XCTAssertEqual(companyCopy.country, expectedCompanyCountry)
    }

    func testThatOptionalPropertyCanBeChangedToNil() {
        let expectedCompanyCountry = Company.noname.country

        let company = Company.apple
        var companyCopy = ChangeableWrapper(company)

        companyCopy.country = expectedCompanyCountry

        XCTAssertEqual(companyCopy.name, company.name)
        XCTAssertEqual(companyCopy.country, expectedCompanyCountry)
    }

    func testThatMultiplePropertiesCanBeChanged() {
        let expectedCompanyName = Company.apple.name
        let expectedCompanyCountry = Company.apple.country

        let company = Company.noname
        var companyCopy = ChangeableWrapper(company)

        companyCopy.name = expectedCompanyName
        companyCopy.country = expectedCompanyCountry

        XCTAssertEqual(companyCopy.name, expectedCompanyName)
        XCTAssertEqual(companyCopy.country, expectedCompanyCountry)
    }

    func testThatNestedPropertyCanBeChanged() {
        let expectedCompanyName = Company.apple.name

        let user = User.youngSteve
        var userCopy = ChangeableWrapper(user)

        userCopy.company.name = expectedCompanyName

        XCTAssertEqual(userCopy.company.name, expectedCompanyName)
        XCTAssertEqual(userCopy.company.country, user.company.country)

        XCTAssertEqual(userCopy.id, user.id)
        XCTAssertEqual(userCopy.name, user.name)
        XCTAssertEqual(userCopy.age, user.age)
    }

    func testThatNestedOptionalPropertyCanBeChangedToValue() {
        let expectedCompanyCountry = Company.apple.country

        let user = User.youngSteve
        var userCopy = ChangeableWrapper(user)

        userCopy.company.country = expectedCompanyCountry

        XCTAssertEqual(userCopy.company.name, user.company.name)
        XCTAssertEqual(userCopy.company.country, expectedCompanyCountry)

        XCTAssertEqual(userCopy.id, user.id)
        XCTAssertEqual(userCopy.name, user.name)
        XCTAssertEqual(userCopy.age, user.age)
    }

    func testThatNestedOptionalPropertyCanBeChangedToNil() {
        let expectedCompanyCountry = Company.noname.country

        let user = User.appleSteve
        var userCopy = ChangeableWrapper(user)

        userCopy.company.country = expectedCompanyCountry

        XCTAssertEqual(userCopy.company.name, user.company.name)
        XCTAssertEqual(userCopy.company.country, expectedCompanyCountry)

        XCTAssertEqual(userCopy.id, user.id)
        XCTAssertEqual(userCopy.name, user.name)
        XCTAssertEqual(userCopy.age, user.age)
    }

    func testThatCopyCanBeEqualToAnotherCopy() {
        var lhsUserCopy = ChangeableWrapper(User.youngSteve)
        var rhsUserCopy = ChangeableWrapper(User.youngSteve)

        lhsUserCopy.id = 123
        rhsUserCopy.id = 123

        XCTAssertEqual(lhsUserCopy, rhsUserCopy)
    }

    func testThatCopyCanNotBeEqualToAnotherCopy() {
        var lhsUserCopy = ChangeableWrapper(User.appleSteve)
        var rhsUserCopy = ChangeableWrapper(User.appleSteve)

        lhsUserCopy.id = 123
        rhsUserCopy.id = 456

        XCTAssertNotEqual(lhsUserCopy, rhsUserCopy)
    }

    func testThatCopyCanBeHashed() {
        var firstUserCopy = ChangeableWrapper(User.nextSteve)
        var secondUserCopy = ChangeableWrapper(User.nextSteve)

        firstUserCopy.id = 123
        secondUserCopy.id = 123

        let set: Set<ChangeableWrapper<User>> = [firstUserCopy, secondUserCopy]

        XCTAssertTrue(set.contains(firstUserCopy))
        XCTAssertTrue(set.contains(secondUserCopy))
    }

    func testThatCopyCanBeGreaterThanAnotherCopy() {
        var lhsUserCopy = ChangeableWrapper(User.youngSteve)
        var rhsUserCopy = ChangeableWrapper(User.youngSteve)

        lhsUserCopy.age = 46
        rhsUserCopy.age = 23

        XCTAssertGreaterThan(lhsUserCopy, rhsUserCopy)
    }

    func testThatCopyCanBeLessThanAnotherCopy() {
        var lhsUserCopy = ChangeableWrapper(User.youngSteve)
        var rhsUserCopy = ChangeableWrapper(User.youngSteve)

        lhsUserCopy.age = 23
        rhsUserCopy.age = 46

        XCTAssertLessThan(lhsUserCopy, rhsUserCopy)
    }

    func testThatCopyCanBeDecoded() {
        let expectedCompany = Company.apple

        let jsonEncoder = JSONEncoder()
        let jsonDecoder = JSONDecoder()

        do {
            let jsonData = try jsonEncoder.encode(expectedCompany)
            let companyCopy = try jsonDecoder.decode(ChangeableWrapper<Company>.self, from: jsonData)

            XCTAssertEqual(companyCopy.name, expectedCompany.name)
            XCTAssertEqual(companyCopy.country, expectedCompany.country)
        } catch {
            XCTFail("Test encountered unexpected error: \(error)")
        }
    }

    @available(iOS 11.0, macOS 10.13, tvOS 11.0, watchOS 3.0, *)
    func testThatCopyCanBeEncoded() {
        let expectedCompany = Company.next

        var companyCopy = ChangeableWrapper(Company.apple)

        companyCopy.name = expectedCompany.name
        companyCopy.country = expectedCompany.country

        let jsonEncoder = JSONEncoder()

        do {
            let expectedJSONData = try jsonEncoder.encode(expectedCompany)
            let jsonData = try jsonEncoder.encode(companyCopy)

            XCTAssertEqual(jsonData, expectedJSONData)
        } catch {
            XCTFail("Test encountered unexpected error: \(error)")
        }
    }
}
