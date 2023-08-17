import UIKit

extension UIApplication {
    var window: UIWindow? {
        UIApplication.shared.windows.filter { $0.isKeyWindow }.first
    }
    
//    /// customed to get latest (top) view controller
//    func topMostViewController() -> UIViewController? {
//        return self.connectedScenes
//            .filter({ $0.activationState == .foregroundActive })
//            .map({ $0 as? UIWindowScene })
//            .compactMap({ $0 })
//            .first?.windows
//            .filter({ $0.isKeyWindow })
//            .first?.rootViewController?.topMostViewController()
//    }
//    
    func restartTo(_ viewController: UIViewController, animated: Bool = true) {
        
        guard let window = self.window else {
            window?.rootViewController = viewController
            return
        }
        if animated {
            UIView.transition(with: window,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                window.rootViewController = viewController
            }, completion: nil)
        }
    }
}
