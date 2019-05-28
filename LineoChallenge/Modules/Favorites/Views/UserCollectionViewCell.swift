import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    private var favorites: Favorites = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViewCell()
    }
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }

    func setupViewCell(with favorites: Favorites) {
        self.favorites = favorites
    }
    
    private func setupViewCell() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionCreatedByUserCell.nib, forCellWithReuseIdentifier: CollectionCreatedByUserCell.reuseIdentifier)
    }
}

extension UserCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCreatedByUserCell.reuseIdentifier, for: indexPath) as! CollectionCreatedByUserCell
        cell.setupCollection(products: favorites[indexPath.row].products, collectionName: favorites[indexPath.row].name)
        return cell
    }
}

extension UserCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 174, height: 178)
    }
}
