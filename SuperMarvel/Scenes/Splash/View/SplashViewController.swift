import UIKit

protocol SplashCoordinatorProtocol {
    func loadCharactersView()
}

class SplashViewController: UIViewController {
    
    // MARK: - Variables
    var coordinator: SplashCoordinatorProtocol!

    // MARK: - View LifeCycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator.loadCharactersView()
    }
    
}
