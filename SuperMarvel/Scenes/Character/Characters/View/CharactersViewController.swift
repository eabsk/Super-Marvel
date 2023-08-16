import UIKit

protocol CharactersCoordinatorProtocol {

}

class CharactersViewController: UIViewController {
    
    // MARK: - Properties

    // MARK: - Variables
    var viewModel: CharactersViewModelProtocol!
    var coordinator: CharactersCoordinatorProtocol!

    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindUI()
    }

    // MARK: - setupUI
    private func setupUI() {
        
    }
    
    // MARK: - bindUI
    private func bindUI() {
        viewModel.getCharacters()
    }
    
}
