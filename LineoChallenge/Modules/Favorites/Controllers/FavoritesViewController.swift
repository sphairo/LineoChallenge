import UIKit

class FavoritesViewController: UIViewController {
    
    var favoritesViewModel = FavoritesViewModel()
    static var numberOfSections: Int = 2
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        favoritesViewModel.attachView(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBarTitle()
    }
}

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FavoritesViewController.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return favoritesViewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        cell.backgroundColor = UIColor.red
        return cell
    }
}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let padding: CGFloat =  50
//        let collectionViewSize = collectionView.frame.size.width - padding
//
//        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        if indexPath.section == 0 {
            return CGSize(width: width  , height: 178)
        }
        return CGSize(width: ((width / 2) - 15)   , height: 174)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width, height: 44)
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

fileprivate extension FavoritesViewController {
    func setupNavigationBarTitle() {
        navigationController?.navigationBar.setupNavigationBarTitle(className: self.className)
    }
    
    func setupView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier)
        collectionView.alwaysBounceVertical = true
    }
}

