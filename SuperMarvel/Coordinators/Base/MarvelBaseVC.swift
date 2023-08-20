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
            marvelLogoImage.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -4),
            marvelLogoImage.centerYAnchor.constraint(equalTo: navBar.centerYAnchor, constant: 0),
            marvelLogoImage.widthAnchor.constraint(equalToConstant: 80),
            marvelLogoImage.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    // MARK: - Add Language Button To NavBar
    func addLanguageButton() {
        guard let iconImage = UIImage(systemName: "globe")
        else { return }

        let spain = UIAction(title: "\(L10n.AppSettingsStr.spanish()) 🇪🇸",
                             image: iconImage, attributes: .destructive) { _ in
            LocalizeService.shared.setLanguage(.spanish)
        }
        
        let english = UIAction(title: "\(L10n.AppSettingsStr.english()) 🇬🇧",
                               image: iconImage) { _ in
            LocalizeService.shared.setLanguage(.english)
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
