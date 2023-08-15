import UIKit

class MainCoordinator: BaseCoordinator<MainFactory> {
    
    var navigationController: UINavigationController
    var appCoordinator: AppCoordinatorProtocol!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        initConfigurations()
        let vc = UIViewController()
        UIApplication.shared.restartTo(vc, animated: true)
    }
    
    func initConfigurations() {
        self.container = MainFactory()
        appCoordinator = AppCoordinator()
    }
    
    func popViewController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func popTopMostViewController(animated: Bool) {
        UIApplication.shared.topMostViewController()?.navigationController?.popViewController(animated: animated)
    }
    
    func popToRootViewController(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    func dismissViewController(animated: Bool, completion: (() -> Void)?) {
        UIApplication.shared.topMostViewController()?.navigationController?.dismiss(animated: animated, completion: completion)
    }
    
}
