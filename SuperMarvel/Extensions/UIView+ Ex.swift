import UIKit

extension UIView {
    // MARK: - Corner Radius
    @IBInspectable var cornerRadius: CGFloat {
         get {
             return layer.cornerRadius
         }
         set {
             layer.cornerRadius = newValue
         }
     }
    
    // MARK: - Set Gradient
    func setGradientBackground(topColor: UIColor, bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
