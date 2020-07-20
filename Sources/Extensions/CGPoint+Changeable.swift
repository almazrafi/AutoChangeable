#if canImport(CoreGraphics)
import CoreGraphics

extension CGPoint: Changeable {

    // MARK: - Initializers

    public init(from copy: ChangeableCopy<Self>) {
        self.init(
            x: copy.x,
            y: copy.y
        )
    }
}

#endif
