import UIKit

protocol SplashCoordinatorProtocol {
    func loadCharactersView()
}

class SplashViewController: UIViewController {
    
    // MARK: - Properties

    // MARK: - Variables
    var viewModel: SplashViewModelProtocol!
    var coordinator: SplashCoordinatorProtocol!

    // MARK: - View LifeCycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self else { return }
            coordinator.loadCharactersView()
        }
    }
    
}
