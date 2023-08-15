import Foundation

protocol AppCoordinatorProtocol: AnyObject {
    func loadSplashView()
    func loadCharactersView()
}

// AppCoordinator
class AppCoordinator: NSObject {
    var mainCoordinator: MainCoordinator = MainCoordinator(navigationController: BaseNavigationController())
}

extension AppCoordinator: AppCoordinatorProtocol {
    
    // MARK: - load Characters View
    func loadCharactersView() {
        mainCoordinator.start()
    }
    
    // MARK: - load Splash
    func loadSplashView() {
        mainCoordinator.setSplashAsRoot()
    }
}
