import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var nameViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationBarTitle()
    }
}

fileprivate extension CartViewController {
    func setupNavigationBarTitle() {
        navigationController?.navigationBar.setupNavigationBarTitle(className: self.className)
    }
    
    func setupView() {
        nameViewLabel.text = Constant.CartScreenName
    }
}
