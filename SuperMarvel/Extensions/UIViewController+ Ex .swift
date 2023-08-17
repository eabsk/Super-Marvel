import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    static let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50),
                                                               type: .circleStrokeSpin,
                                                               color: .red,
                                                               padding: 0)
    static let activityIndicatorContainerView = UIView()
    
    static func getLoaderViews() -> (UIView, NVActivityIndicatorView) {
        let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 80, y: 80, width: 60, height: 60),
                                                            type: .ballTrianglePath, color: .systemBackground)
        let blurView = UIView()
        return (blurView, activityIndicatorView)
    }
    
    // MARK: - Show Default Loader
    func showDefaultLoader(view: UIView, blurView: UIView, activityIndicatorView: NVActivityIndicatorView) {
        
        blurView.isHidden = false
        blurView.frame = view.frame
        blurView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        view.addSubview(blurView)
        activityIndicatorView.center = blurView.center
        view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }
    
    // MARK: - Hide Default Loader
    func hideDefaultLoader(activityIndicatorView: NVActivityIndicatorView, blurView: UIView) {
        activityIndicatorView.stopAnimating()
        blurView.isHidden = true
    }
    
    func showDefaultLoader(viewLoadingContainer: inout UIView) {
        hideDefaultLoader()
        UIViewController.activityIndicatorContainerView.frame = CGRect(x: 0, y: 0,
                                                                       width: viewLoadingContainer.frame.width + 24,
                                                                       height: viewLoadingContainer.frame.height + 38)
        UIViewController.activityIndicatorContainerView.backgroundColor = .systemGray3.withAlphaComponent(0.6)
        UIViewController.activityIndicatorView.center = UIViewController.activityIndicatorContainerView.center
        UIViewController.activityIndicatorView.startAnimating()
        navigationController?.isNavigationBarHidden = true
        UIViewController.activityIndicatorContainerView.addSubview(UIViewController.activityIndicatorView)
        viewLoadingContainer.addSubview(UIViewController.activityIndicatorContainerView)
    }
    
    // MARK: - Hide Default Loader
    func hideDefaultLoader() {
        UIViewController.activityIndicatorView.stopAnimating()
        UIViewController.activityIndicatorView.removeFromSuperview()
        navigationController?.isNavigationBarHidden = false
        UIViewController.activityIndicatorContainerView.removeFromSuperview()
    }
}
