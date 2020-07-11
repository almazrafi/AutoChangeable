#if canImport(UIKit)
import UIKit

extension UIEdgeInsets: Changeable {

    public init(copy: ChangeableWrapper<Self>) {
        self.init(
            top: copy.top,
            left: copy.left,
            bottom: copy.bottom,
            right: copy.right
        )
    }
}

#endif
