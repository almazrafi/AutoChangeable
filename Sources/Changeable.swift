import Foundation

public protocol Changeable {

    // MARK: - Instance Methods

    init(from copy: ChangeableCopy<Self>)
}

extension Changeable {

    // MARK: - Instance Methods

    public func changing(_ change: (inout ChangeableCopy<Self>) -> Void) -> Self {
        var copy = ChangeableCopy<Self>(original: self)

        change(&copy)

        return Self(from: copy)
    }
}
