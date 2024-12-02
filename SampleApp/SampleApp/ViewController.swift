import UIKit
import Foo

class ViewController: UIViewController {

    private lazy var customLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .cyan
        self.view.addSubview(customLabel)

        NSLayoutConstraint.activate([
            customLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            customLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])

        let foo = Foo()

        customLabel.text = "Hello, World! \(foo.msg)"
    }
}

