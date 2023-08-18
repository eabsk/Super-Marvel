import UIKit
import Combine

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinatorProtocol!
    private var cancelAbles: Set<AnyCancellable> = []

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        startServices()
        return true
    }
    
    private func setRootViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        appCoordinator = AppCoordinator()
        appCoordinator.loadSplashView()
    }
    
    private func startServices() {
        KeyboardStateManager.shared.start()
        LocalizeService.shared.startService()
        AppObservers.Language.onChangeLanguage.receive(on: DispatchQueue.main).sink {
            self.setRootViewController()
        }.store(in: &cancelAbles)
    }
}
