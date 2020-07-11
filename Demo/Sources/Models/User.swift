import Foundation
import AutoChangeable

struct User: AutoChangeable {

    // MARK: - Instance Properties

    let id: Int
    let name: String
    let age: Int
    let company: Company
}
