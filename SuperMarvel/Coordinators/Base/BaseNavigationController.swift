import UIKit

class BaseNavigationController: UINavigationController {
    
    private var tintColor = UIColor.systemRed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationBar.backgroundColor = .white
        
        initializeNavigationBarAppearance()
        
        setNeedsStatusBarAppearanceUpdate() // For preferredStatusBarStyle
        
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFontSize,
            NSAttributedString.Key.foregroundColor: tintColor
        ]
        
        // increase height for navigation bar all over the app
        if #available(iOS 11.0, *) {
            self.additionalSafeAreaInsets.top = 16
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    func removeBorder() {
        navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    func showBorder() {
        navigationBar.setValue(false, forKey: "hidesShadow")
    }
    
    func initializeNavigationBarAppearance() {
        navigationBar.tintColor = tintColor
    }
    
    func setNavBarHandleForTransparent() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        view.backgroundColor = .clear
    }
}
