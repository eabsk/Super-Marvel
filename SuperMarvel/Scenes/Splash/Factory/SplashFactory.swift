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
