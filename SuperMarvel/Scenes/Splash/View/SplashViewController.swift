//  
//  SplashViewController.swift
//  SuperMarvel
//
//  Created by Eslam Abdelmaqsoud on 16/08/2023.
//

import UIKit

protocol SplashCoordinatorProtocol {

}

class SplashViewController: MarvelBaseViewController {
    
    // MARK: - Properties

    // MARK: - Variables
    var viewModel: SplashViewModelProtocol!
    var coordinator: SplashCoordinatorProtocol!

    // MARK: - View LifeCycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(true)
        
    }

}
