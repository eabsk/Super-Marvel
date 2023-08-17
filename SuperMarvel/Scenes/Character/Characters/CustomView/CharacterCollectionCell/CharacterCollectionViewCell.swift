import UIKit

protocol CharacterCollectionViewCellProtocol {
    func configureCell(character: CharacterModel)
}

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gradientLayerView: UIView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutGradient()
    }

    private func layoutGradient() {
        gradientLayerView.setGradientBackground(topColor: .clear,
                                                bottomColor: .systemGray)
    }
}

extension CharacterCollectionViewCell: CharacterCollectionViewCellProtocol {
    func configureCell(character: CharacterModel) {
        characterNameLabel.text = character.name
        characterImageView.getImage(imagePath: character.image)
    }
}
