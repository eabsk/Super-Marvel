import UIKit

extension UICollectionView {
    
    func registerNib<Cell: UICollectionViewCell>(cellClass: Cell.Type, bundle: Bundle? = nil) {
        register(UINib(nibName: String(describing: Cell.self), bundle: bundle), forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    /// Dequeue CollectionView CELL
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else { fatalError("Error in cell") }
        return cell
    }
}

// MARK: - Empty-State View
extension UICollectionView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .label
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 18)
        messageLabel.sizeToFit()

        backgroundView = messageLabel
    }

    func restore() {
        self.backgroundView = nil
    }
}
