import Foundation

extension Dictionary: Changeable {

    public typealias ChangeableCopy = Self
}

extension Dictionary where Value: Changeable {

    subscript(key: Key) -> Value.ChangeableCopy? {
        get { self[key].map { $0.changeableCopy } }
        set { self[key] = newValue.map { Value(copy: $0) } }
    }
}
