import UIKit
import AutoChangeable

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let apple = Company(name: "Apple", country: "USA")
        let steve = User(id: 1, name: "Steve", age: 21, company: apple)

        let steveJobs = steve.changing { newUser in
            newUser.name = "Steve Jobs"
            newUser.age = 30
            newUser.company.name = "NeXT"
        }

        print("original: \(steve)")
        print("changed: \(steveJobs)")
    }
}
