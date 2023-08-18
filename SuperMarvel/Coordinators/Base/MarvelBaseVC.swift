import UIKit
import Combine

class MarvelBaseVC: UIViewController {
    
    var cancellable: Set<AnyCancellable> = []
    var onRefresherControllerReload: (() -> Void)?

    lazy public var refresherController: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.reloadData), for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    
    @objc
    func reloadData() {
        onRefresherControllerReload?()
    }
}
