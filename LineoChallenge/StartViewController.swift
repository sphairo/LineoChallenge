import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
    }
    
    private func setupView() {
        navigationController?.navigationBar.topItem?.title = "Title for start!"
    }
}

