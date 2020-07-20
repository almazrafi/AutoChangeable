#if canImport(CoreGraphics)
import CoreGraphics

extension CGSize: Changeable {

    // MARK: - Initializers

    public init(from copy: ChangeableCopy<Self>) {
        self.init(
            width: copy.width,
            height: copy.height
        )
    }
}

#endif
