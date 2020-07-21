import UIKit
import ChangeableCopy

protocol SomeCopy {
    associatedtype Original
}

protocol Some {

    associatedtype Copy: SomeCopy where Copy.Original == Self

    init(from copy: Copy)
}

extension Some where Copy == Self {
    init(from copy: Copy) {
        self = copy
    }
}

class New: Some, SomeCopy {
    typealias Copy = New
    typealias Original = New

    var title: String
    var description: String

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let new = New(title: "", description: "")
        let new2 = New(from: new)

        new.title = "123"

        print(new.title)
        print(new2.title)
    }
}
