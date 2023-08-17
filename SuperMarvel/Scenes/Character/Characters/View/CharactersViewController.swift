import UIKit

protocol CharactersCoordinatorProtocol {
    
}

class CharactersViewController: MarvelBaseVC {
    
    // MARK: - Properties
    @IBOutlet weak var charactersCollectionView: UICollectionView!
    private let insetsWidth: CGFloat = Configurations.insetsWidth
    
    // MARK: - Variables
    var viewModel: CharactersViewModelProtocol!
    var coordinator: CharactersCoordinatorProtocol!
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Marvel Characters"
        setupUI()
        bindUI()
    }
    
    private func setupCollectionView() {
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        charactersCollectionView.registerNib(cellClass: CharacterCollectionViewCell.self)
    }
    
    // MARK: - setupUI
    private func setupUI() {
        setupCollectionView()
        showDefaultLoader(viewLoadingContainer: view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self else { return }
            self.hideDefaultLoader()
        }
    }
    
    // MARK: - bindUI
    private func bindUI() {
        viewModel.getCharacters()
        viewModel.shouldReloadPublisher
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.charactersCollectionView.reloadData()
            }.store(in: &cancellable)
        
    }
    
}

extension CharactersViewController: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.charactersCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CharacterCollectionViewCell = collectionView.dequeue(indexPath: indexPath)
        viewModel.configure(cell: cell, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        getCharactersCellSize()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: insetsWidth, bottom: insetsWidth, right: insetsWidth)
    }
}
