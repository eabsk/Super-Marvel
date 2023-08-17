import UIKit

extension UITableView {
    
     func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type, bundle: Bundle? = nil) {
        register(UINib(nibName: String(describing: Cell.self), bundle: bundle), forCellReuseIdentifier: String(describing: Cell.self))
    }

     func dequeue<Cell: UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        
        guard let cell = dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        
        return cell
    }
    
     func registerClassFor(headerFooterViewClass: UITableViewHeaderFooterView.Type) {
        self.register(headerFooterViewClass,
                      forHeaderFooterViewReuseIdentifier: headerFooterViewClass.viewIdentifier)
    }
    
     func dequeueHeaderView<T: UITableViewHeaderFooterView>(headerFooterViewClass: T.Type) -> T? {
        return self.dequeueReusableHeaderFooterView(withIdentifier: headerFooterViewClass.viewIdentifier) as? T
    }
}

extension UITableViewCell {
    
    static var cellIdentifier: String {
        return NSStringFromClass(Self.self)
    }
    
    static var cellNibName: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last ?? ""
    }
}

extension UITableViewHeaderFooterView {
    
    static var viewIdentifier: String {
        return NSStringFromClass(Self.self)
    }
    
    static var viewNibName: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last ?? ""
    }
}
