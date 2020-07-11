import Foundation
import ChangeableCopy

struct User: Hashable, Codable {

    // MARK: - Instance Properties

    let id: Int
    let name: String
    let age: Int
    let company: Company
}

extension User: Comparable {

    // MARK: - Type Methods

    static func < (lhs: User, rhs: User) -> Bool {
        lhs.age < rhs.age
    }
}

extension User: Changeable {

    // MARK: - Initializers

    init(from copy: ChangeableCopy<User>) {
        self.init(
            id: copy.id,
            name: copy.name,
            age: copy.age,
            company: copy.company
        )
    }
}

extension User {

    // MARK: - Type Properties

    static let youngSteve = User(id: 1, name: "Steve", age: 20, company: .noname)
    static let appleSteve = User(id: 1, name: "Steve", age: 21, company: .apple)
    static let nextSteve = User(id: 1, name: "Steve", age: 30, company: .next)
}
