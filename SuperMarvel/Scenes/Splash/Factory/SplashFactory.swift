import UIKit

extension MainFactory {
    
    func resolveSplashController(coordinator: SplashCoordinatorProtocol) -> SplashViewController {
        
        let vc = SplashViewController()
        vc.coordinator = coordinator
        return vc
    }
}
