#if canImport(CoreGraphics)
import CoreGraphics

extension CGRect: Changeable {

    public init(copy: ChangeableWrapper<Self>) {
        self.init(
            origin: copy.origin,
            size: copy.size
        )
    }
}

#endif
