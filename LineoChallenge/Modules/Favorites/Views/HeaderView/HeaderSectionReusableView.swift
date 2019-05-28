import UIKit

class HeaderSectionReusableView: UICollectionReusableView {

    @IBOutlet weak var nameSectionLabel: UILabel!
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupTitleSection(numberItems: String) {
        let totalItems = NSLocalizedString("FavoritesNameSection", comment: "Favorites name section with counter")
        let titleSection = totalItems.replacingOccurrences(of: "(%@)", with: numberItems)
        nameSectionLabel.text = titleSection
    }
    
}
