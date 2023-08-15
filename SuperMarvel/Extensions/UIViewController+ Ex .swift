//
//  UIViewController+ Ex .swift
//  SuperMarvel
//
//  Created by Eslam Abdelmaqsoud on 16/08/2023.
//

import UIKit

extension UIViewController {
    
    /// customed to get latest (top) view controller
    public func topMostViewController() -> UIViewController {
        
        if let presented = self.presentedViewController {
            return presented.topMostViewController()
        }
        
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController() ?? navigation
        }
        
        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topMostViewController() ?? tab
        }
        
        return self
    }
}
