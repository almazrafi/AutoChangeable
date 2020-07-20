#if canImport(CoreGraphics)
import CoreGraphics

extension CGRect: Changeable {

    // MARK: - Initializers

    public init(from copy: ChangeableCopy<Self>) {
        self.init(
            origin: copy.origin,
            size: copy.size
        )
    }
}

#endif
