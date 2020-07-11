#if canImport(CoreGraphics)
import CoreGraphics

extension CGPoint: Changeable {

    public init(copy: ChangeableWrapper<Self>) {
        self.init(
            x: copy.x,
            y: copy.y
        )
    }
}

#endif
