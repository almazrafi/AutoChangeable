import Foundation
import AutoChangeable

struct User: AutoChangeable {

    let id: Int
    let name: String
    let age: Int
    let company: Company
}
