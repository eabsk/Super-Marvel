//  
//  SplashFactory.swift
//  SuperMarvel
//
//  Created by Eslam Abdelmaqsoud on 16/08/2023.
//

import UIKit

extension MainFactory {
    
    func resolveSplashViewModel() -> SplashViewModelProtocol {
       SplashViewModel()
    }
    
    func resolveSplashController(coordinator: SplashCoordinatorProtocol) -> SplashViewController {
        
        let vc = SplashViewController()
        vc.coordinator = coordinator
        vc.viewModel = resolveSplashViewModel()
        return vc
    }
}
