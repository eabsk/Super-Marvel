import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    static let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 80, height: 80),
                                                               type: .ballTrianglePath,
                                                               color: .label,
                                                               padding: 0)
    static let activityIndicatorContainerView = UIView()
    
    func showDefaultLoader(viewLoadingContainer: UIView) {
        hideDefaultLoader()
        
        UIViewController.activityIndicatorContainerView.frame = navigationController?.view.frame ?? CGRect()
        UIViewController.activityIndicatorContainerView.center = navigationController?.view.center ?? CGPoint()
        UIViewController.activityIndicatorContainerView.backgroundColor = .systemBackground.withAlphaComponent(0.7)
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
    
    func getCharactersCellSize() -> CGSize {
        let insetsWidth: CGFloat = Configurations.insetsWidth
        let horizontalItemCount: CGFloat = 2
        let verticalItemCount: CGFloat = 3
        let insetsSpaces: CGFloat = insetsWidth * 3
        let width = (view.frame.size.width - insetsSpaces) / horizontalItemCount
        let height = view.frame.size.height / verticalItemCount
        return CGSize(width: width, height: height)
    }
}
