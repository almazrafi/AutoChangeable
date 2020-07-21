#if canImport(CoreGraphics)
import CoreGraphics

extension CGSize: Changeable {

    public init(copy: ChangeableWrapper<Self>) {
        self.init(
            width: copy.width,
            height: copy.height
        )
    }
}

#endif
