import Foundation

@dynamicMemberLookup
public struct ChangeableCopy<Root> {

    // MARK: - Instance Properties

    private let original: Root
    private var changes: [PartialKeyPath<Root>: Any] = [:]

    // MARK: - Initializers

    public init(original: Root) {
        self.original = original
    }

    // MARK: - Instance Subscripts

    public subscript<T>(dynamicMember keyPath: KeyPath<Root, T>) -> T {
        get { changes[keyPath].flatMap { $0 as? T } ?? original[keyPath: keyPath] }
        set { changes[keyPath] = newValue }
    }

    public subscript<T: Changeable>(dynamicMember keyPath: KeyPath<Root, T>) -> ChangeableCopy<T> {
        get { ChangeableCopy<T>(original: self[dynamicMember: keyPath]) }
        set { self[dynamicMember: keyPath] = T(from: newValue) }
    }
}

extension ChangeableCopy: Equatable where Root: Equatable & Changeable {

    // MARK: - Type Methods

    public static func == (lhs: ChangeableCopy<Root>, rhs: ChangeableCopy<Root>) -> Bool {
        Root(from: lhs) == Root(from: rhs)
    }
}

extension ChangeableCopy: Hashable where Root: Hashable & Changeable {

    // MARK: - Instance Methods

    public func hash(into hasher: inout Hasher) {
        original.hash(into: &hasher)
    }
}

extension ChangeableCopy: Comparable where Root: Comparable & Changeable {

    // MARK: - Type Meethods

    public static func < (lhs: ChangeableCopy<Root>, rhs: ChangeableCopy<Root>) -> Bool {
        Root(from: lhs) < Root(from: rhs)
    }
}

extension ChangeableCopy: Decodable where Root: Decodable & Changeable {

    // MARK: - Initializers

    public init(from decoder: Decoder) throws {
        self.init(original: try Root(from: decoder))
    }
}

extension ChangeableCopy: Encodable where Root: Encodable & Changeable {

    // MARK: - Instance Methods

    public func encode(to encoder: Encoder) throws {
        try Root(from: self).encode(to: encoder)
    }
}
