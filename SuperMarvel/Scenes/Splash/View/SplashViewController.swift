//  
//  SplashViewController.swift
//  SuperMarvel
//
//  Created by Eslam Abdelmaqsoud on 16/08/2023.
//

import UIKit

protocol SplashCoordinatorProtocol {

}

class SplashViewController: UIViewController {
    
    // MARK: - Properties

    // MARK: - Variables
    var viewModel: SplashViewModelProtocol!
    var coordinator: SplashCoordinatorProtocol!

    // MARK: - View LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

}
