import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }

}
