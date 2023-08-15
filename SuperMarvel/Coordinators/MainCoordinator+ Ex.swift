//
//  MainCoordinator+ Ex.swift
//  SuperMarvel
//
//  Created by Eslam Abdelmaqsoud on 16/08/2023.
//

import UIKit

// MARK: - Splash As Root
extension MainCoordinator: SplashCoordinatorProtocol {
    
    func setSplashAsRoot() {
        initConfigurations()
        let vc = container.resolveSplashController(coordinator: self)
        UIApplication.shared.restartTo(vc, animated: true)
    }
}
