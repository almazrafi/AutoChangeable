// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable all

import Foundation

#if canImport(ChangeableCopy)
import ChangeableCopy
#endif

extension Company {

    internal init(from copy: ChangeableCopy<Company>) {
        self.init(
            name: copy.name,
            country: copy.country
        )
    }
}

extension User {

    internal init(from copy: ChangeableCopy<User>) {
        self.init(
            id: copy.id,
            name: copy.name,
            age: copy.age,
            company: copy.company
        )
    }
}

