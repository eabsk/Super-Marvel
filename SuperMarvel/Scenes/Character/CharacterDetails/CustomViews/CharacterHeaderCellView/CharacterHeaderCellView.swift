import UIKit

protocol CharacterHeaderCellViewProtocol {
    func configure(name: String, imagePath: String)
}

class CharacterHeaderCellView: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    @IBOutlet weak var gradientView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientView.setGradientBackground(topColor: UIColor.clear, bottomColor: UIColor.systemGray)
    }
}

extension CharacterHeaderCellView: CharacterHeaderCellViewProtocol {
    
    func configure(name: String, imagePath: String) {
        characterNameLabel.text = name
        characterImageView.getImage(imagePath: imagePath)
    }
}
