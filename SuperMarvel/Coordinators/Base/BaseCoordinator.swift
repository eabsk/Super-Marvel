import Foundation

protocol Coordinator: AnyObject {
    func start()
    func didChangeLanguage()
}

extension Coordinator {
    func didChangeLanguage() {
        self.start()
    }
}

class MainFactory {
    
}

class BaseCoordinator <T: MainFactory>: Coordinator {
    
    var container: T!

    public func start() {
        fatalError("must be implemented in subclass")
    }
}
