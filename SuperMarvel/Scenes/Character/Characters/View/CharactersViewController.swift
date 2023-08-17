import UIKit

protocol CharactersCoordinatorProtocol {
    
}

class CharactersViewController: UIViewController {
    
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
//        let (blurView, activityIndicatorView) = UIViewController.getLoaderViews()
//        showDefaultLoader(view: view, blurView: blurView, activityIndicatorView: activityIndicatorView)
        showDefaultLoader(viewLoadingContainer: &view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self else { return }
            self.hideDefaultLoader()
        }
    }
    
    // MARK: - bindUI
    private func bindUI() {
        viewModel.getCharacters()
    }
    
}

extension CharactersViewController: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CharacterCollectionViewCell = collectionView.dequeue(indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalItemCount: CGFloat = 2
        let verticalItemCount: CGFloat = 3
        let insetsWidth: CGFloat = insetsWidth * 3
        let width = (view.frame.size.width - insetsWidth) / horizontalItemCount
        let height = view.frame.size.height / verticalItemCount
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: insetsWidth, bottom: 0, right: insetsWidth)
    }
}
