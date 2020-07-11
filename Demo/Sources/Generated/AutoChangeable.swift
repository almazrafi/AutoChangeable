// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// swiftlint:disable all

import Foundation

#if canImport(AutoChangeable)
import AutoChangeable
#endif

extension Company {

    internal init(copy: ChangeableWrapper<Self>) {
        self.init(
            name: copy.name,
            country: copy.country
        )
    }
}

extension User {

    internal init(copy: ChangeableWrapper<Self>) {
        self.init(
            id: copy.id,
            name: copy.name,
            age: copy.age,
            company: copy.company
        )
    }
}

