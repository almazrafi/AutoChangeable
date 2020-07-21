import Foundation
import AutoChangeable

struct Company: Hashable, Codable {

    // MARK: - Instance Properties

    let name: String
    let country: String?
}

extension Company: Changeable {

    // MARK: - Initializers

    init(copy: ChangeableWrapper<Self>) {
        self.init(
            name: copy.name,
            country: copy.country
        )
    }
}

extension Company {

    // MARK: - Type Properties

    static let noname = Company(name: "Noname", country: nil)
    static let apple = Company(name: "Apple", country: "USA")
    static let next = Company(name: "NeXT", country: "USA")
}
