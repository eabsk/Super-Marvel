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
