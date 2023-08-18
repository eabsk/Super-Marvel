import UIKit

protocol CharactersCoordinatorProtocol {
    func loadCharacterDetailsView(character: CharacterModel)
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
        setupUI()
        bindUI()
    }
    
    private func setupCollectionView() {
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        charactersCollectionView.refreshControl = refresherController
        charactersCollectionView.registerNib(cellClass: CharacterCollectionViewCell.self)
        onStartRefresher = { [weak self] in
            guard let self else { return }
            self.viewModel.didPullToRefresh()
        }
    }
    
    // MARK: - setupUI
    private func setupUI() {
        title = L10n.CharacterStr.marvelCharacters()
        setupCollectionView()
        addMarvelLogoToNavBar()
        addLanguageButton()
    }
    
    // MARK: - bindUI
    private func bindUI() {
        viewModel.getCharacters()
        viewModel.shouldReloadPublisher
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.charactersCollectionView.reloadData()
            }.store(in: &cancellable)
        
        viewModel.shouldStopRefresherPublisher
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.refresherController.endRefreshing()
            }.store(in: &cancellable)
        
        viewModel.showErrorMessagePublisher
            .receive(on: DispatchQueue.main)
            .sink { errorMessage in
                ToastManager.shared.showError(message: errorMessage, view: self.view)
            }.store(in: &cancellable)
        
        viewModel.isLoadingPublisher
            .receive(on: DispatchQueue.main)
            .sink { isLoading in
                isLoading ?
                self.showDefaultLoader() : self.hideDefaultLoader()
            }.store(in: &cancellable)
    }
    
}

// MARK: - CollectionView Delegate
extension CharactersViewController: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.charactersCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CharacterCollectionViewCell = collectionView.dequeue(indexPath: indexPath)
        viewModel.configure(cell: cell, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = viewModel.didSelectCharacter(index: indexPath.row)
        coordinator.loadCharacterDetailsView(character: character)
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.charactersCount - 1
            && viewModel.charactersCount < viewModel.totalCharactersCount {
            viewModel.getMoreCharacters()
        }
    }
}
