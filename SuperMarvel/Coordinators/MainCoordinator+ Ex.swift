//
//  MainCoordinator+ Ex.swift
//  SuperMarvel
//
//  Created by Eslam Abdelmaqsoud on 16/08/2023.
//

import UIKit

// MARK: - Main App + Splash
extension MainCoordinator {
    
    func setSplashAsRoot() {
        initConfigurations()
        let vc = UIViewController()
        vc.view.backgroundColor = .orange
        UIApplication.shared.restartTo(vc, animated: true)
    }
}
