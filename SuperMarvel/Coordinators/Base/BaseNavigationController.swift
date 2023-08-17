import UIKit

class BaseNavigationController: UINavigationController {
    
    private var tintColor = UIColor.systemRed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationBar.backgroundColor = .systemBackground
        
        initializeNavigationBarAppearance()
        
        setNeedsStatusBarAppearanceUpdate() // For preferredStatusBarStyle
        
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .semibold),
            NSAttributedString.Key.foregroundColor: tintColor
        ]
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
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
