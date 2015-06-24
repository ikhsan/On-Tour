
import UIKit

class ArtistCell: UICollectionViewCell {
    
    @IBOutlet weak var onTourBadgeView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var arrowView: UILabel!
    
    override var highlighted: Bool {
        didSet {
            self.backgroundColor = self.highlighted ? UIColor.grayColor() : UIColor.whiteColor()
            
            let color = self.highlighted ? UIColor.whiteColor() : UIColor.darkGrayColor()
            self.nameLabel.textColor = color
            self.arrowView.textColor = color
        }
    }

}
