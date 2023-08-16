import Foundation

protocol AppCoordinatorProtocol: AnyObject {
    func loadSplashView()
}

class AppCoordinator: NSObject {
    private var mainCoordinator: MainCoordinator = MainCoordinator(navigationController: BaseNavigationController())
}

extension AppCoordinator: AppCoordinatorProtocol {
    
    // MARK: - load Splash
    func loadSplashView() {
        mainCoordinator.setSplashAsRoot()
    }
}
