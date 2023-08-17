import UIKit
import Kingfisher

extension UIImageView {
    
   public func getImage(imagePath: String) {
        if let url = URL(string: imagePath) {
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url,
                             placeholder: Asset.Assets.placeholderAvatar.image,
                             options: [.transition(.fade(0.3))])
        }
    }
}
