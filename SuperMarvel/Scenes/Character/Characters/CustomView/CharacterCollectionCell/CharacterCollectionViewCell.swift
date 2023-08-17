import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gradientLayerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientLayerView.setGradientBackground(topColor: .clear, bottomColor: UIColor.systemBackground.withAlphaComponent(0.7))
    }

}
