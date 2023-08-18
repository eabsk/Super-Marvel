import UIKit
import Combine
import NVActivityIndicatorView

class MarvelBaseVC: UIViewController {
    
    var cancellable: Set<AnyCancellable> = []
    var onStartRefresher: (() -> Void)?
    private var viewLoadingContainer: UIView?
    private var activityIndicatorView: NVActivityIndicatorView?
    lazy public var refresherController: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.reloadData), for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    
    lazy var marvelLogoImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = Asset.Assets.marvelLogo.image
        return image
    }()
    
    @objc
    private func reloadData() {
        onStartRefresher?()
    }
    
    // MARK: - add Logo to NavBar
    func addMarvelLogoToNavBar() {
        guard let navBar = self.navigationController?.navigationBar else { return }
        navBar.addSubview(marvelLogoImage)
        NSLayoutConstraint.activate([
            marvelLogoImage.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -16),
            marvelLogoImage.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: 0),
            marvelLogoImage.widthAnchor.constraint(equalToConstant: 90),
            marvelLogoImage.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Add Language Button To NavBar
    func addLanguageButton() {
        guard let iconImage = UIImage(systemName: "globe")
        else { return }

        let spain = UIAction(title: "Spain 🇪🇸", image: iconImage, attributes: .destructive) { _ in
            
        }
        
        let english = UIAction(title: "English 🇬🇧", image: iconImage) { _ in
            
        }
        
        let languageButton = UIButton(type: .system)
        languageButton.setImage(iconImage, for: .normal)
        if #available(iOS 14.0, *) {
            languageButton.showsMenuAsPrimaryAction = true
            languageButton.menu = UIMenu(title: "", children: [spain, english])
        } else {
            // show bottom Sheet with available languages
        }
        languageButton.addTarget(self, action: #selector(presentMenu), for: .touchUpInside)
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: languageButton)]
    }
    
    // MARK: - Show Default Loader
    func showDefaultLoader() {
        
        hideDefaultLoader()
        
        if viewLoadingContainer != nil && view.subviews.contains(viewLoadingContainer ?? UIView()) {
            return;
        }
        
        if activityIndicatorView == nil {
            activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 80, height: 80),
                                                            type: .ballTrianglePath, color: .label,
                                                            padding: 0)
        }
        
        var center = CGPoint()
        if let frame = navigationController?.view.bounds {
            viewLoadingContainer = UIView(frame: frame)
            viewLoadingContainer?.frame.origin.y = 0
            viewLoadingContainer?.backgroundColor = UIColor.systemGray.withAlphaComponent(0.5)
            center = navigationController?.view.center ?? CGPoint()
        }
        center.y -= 0
        activityIndicatorView?.center = center
        activityIndicatorView?.startAnimating()
        if let activityIndicatorView, let viewLoadingContainer {
            viewLoadingContainer.addSubview(activityIndicatorView)
            navigationController?.view.addSubview(viewLoadingContainer)
        }
    }
    
    // MARK: - Hide Default Loader
    func hideDefaultLoader() {
        if let activity = activityIndicatorView {
            activity.removeFromSuperview()
            activity.stopAnimating()
        }
        
        if let loadingContainer = viewLoadingContainer {
            loadingContainer.removeFromSuperview()
        }
    }
    
    @objc
    private func presentMenu() {
      
    }
}

class ContextMenuButton: UIButton {
    var previewProvider: UIContextMenuContentPreviewProvider?
    var actionProvider: UIContextMenuActionProvider?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        let interaction = UIContextMenuInteraction(delegate: self)
        addInteraction(interaction)
        backgroundColor = .green
    }

    override func contextMenuInteraction(_ interaction: UIContextMenuInteraction,
                                         configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: previewProvider,
            actionProvider: actionProvider
        )
    }
}
