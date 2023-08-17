import UIKit

protocol CharacterDetailsCoordinatorProtocol {
    
}

class CharacterDetailsViewController: MarvelBaseVC {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var viewModel: CharacterDetailsViewModelProtocol!
    var coordinator: CharacterDetailsCoordinatorProtocol!
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.registerCellNib(cellClass: CharacterDescriptionTableCell.self)
        tableView.registerCellNib(cellClass: CharacterHeaderCellView.self)
        tableView.registerCellNib(cellClass: CharacterCollectionsTableCell.self)
    }
    // MARK: - setupUI
    private func setupUI() {
        setupTableView()
    }
  
}

// MARK: - TableView DataSource
extension CharacterDetailsViewController: TableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let headerView = tableView.dequeue() as CharacterHeaderCellView
            viewModel.configure(cell: headerView)
            return headerView
        case 1:
            let cell = tableView.dequeue() as CharacterDescriptionTableCell
            viewModel.configure(cell: cell)
            return cell
        case 2:
            let cell = tableView.dequeue() as CharacterCollectionsTableCell
            viewModel.configure(cell: cell)
            return cell
        default: return UITableViewCell()
        }
    }
}
