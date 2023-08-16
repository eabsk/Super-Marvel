import UIKit

// MARK: - Splash As Root
extension MainCoordinator: SplashCoordinatorProtocol {
    
    func setSplashAsRoot() {
        initConfigurations()
        let vc = container.resolveSplashController(coordinator: self)
        UIApplication.shared.restartTo(vc, animated: true)
    }
}

// MARK: - load Characters View
extension MainCoordinator: CharactersCoordinatorProtocol {
    
    func loadCharactersView() {
        let vc = container.resolveCharactersController(coordinator: self)
        navigationController = BaseNavigationController(rootViewController: vc)
        UIApplication.shared.restartTo(navigationController, animated: true)
    }
    
}
