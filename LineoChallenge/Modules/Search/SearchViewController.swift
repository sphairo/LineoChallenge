import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var nameViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNavigationBarTitle()
    }

}

fileprivate extension SearchViewController {
    func setupNavigationBarTitle() {
        navigationController?.navigationBar.setupNavigationBarTitle(className: self.className)
    }
    
    func setupView() {
        nameViewLabel.text = Constant.SearchScreenName
    }
}

