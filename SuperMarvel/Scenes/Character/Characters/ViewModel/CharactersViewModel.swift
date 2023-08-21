import Combine

protocol CharactersViewModelProtocol {
    func getCharacters()
    var charactersCount: Int { get }
    var totalCharactersCount: Int { get }
    var shouldReloadPublisher: PassthroughSubject<Void, Never> { get }
    var shouldStopRefresherPublisher: PassthroughSubject<Void, Never> { get }
    var showErrorMessagePublisher: PassthroughSubject<String, Never> { get }
    var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
    var isEmptyStatePublisher: AnyPublisher<Bool, Never> { get }
    func didPullToRefresh()
    func configure(cell: CharacterCollectionViewCellProtocol, index: Int)
    func didSelectCharacter(index: Int) -> CharacterModel
    func getMoreCharacters()
}

class CharactersViewModel {
    
    private var cancelAbles: Set<AnyCancellable> = []
    
    private let charactersUC: CharactersUC
    private var characters: [CharacterModel] = []
    
    private var offset = 0
    private(set) var totalCharactersCount: Int = 0
    
    var shouldReloadPublisher: PassthroughSubject<Void, Never> = PassthroughSubject()
    var shouldStopRefresherPublisher: PassthroughSubject<Void, Never> = PassthroughSubject()
    var showErrorMessagePublisher: PassthroughSubject<String, Never> = PassthroughSubject()
    
    @Published private var isLoading: Bool = false
    var isLoadingPublisher: AnyPublisher<Bool, Never> { $isLoading.eraseToAnyPublisher() }
    
    @Published private var isEmptyData = false
    var isEmptyStatePublisher: AnyPublisher<Bool, Never> { $isEmptyData.eraseToAnyPublisher() }
    
    init(charactersUC: CharactersUC) {
        self.charactersUC = charactersUC
    }
    
    func getCharacters() {
        isLoading = true
        let params = CharactersParams(offset: offset)
        let characters = charactersUC.execute(with: params)
        characters.sink { completion in
            switch completion {
            case .finished:
                self.didFinishRequest()
            case .failure(let error):
                self.isEmptyData = true
                self.didFinishRequest(withError: error.message)
            }
        } receiveValue: { response in
            self.totalCharactersCount = response.data?.total ?? 0
            let characters = CharacterMapper.instance.mapToCharacters(characters: response.data?.results)
            self.isEmptyData = characters.isEmpty
            self.characters.append(contentsOf: characters)
        }.store(in: &cancelAbles)
    }
}

extension CharactersViewModel: CharactersViewModelProtocol {
    
    var charactersCount: Int {
        characters.count
    }
    
    func configure(cell: CharacterCollectionViewCellProtocol, index: Int) {
        let character = characters[index]
        cell.configureCell(character: character)
    }
    
    func didSelectCharacter(index: Int) -> CharacterModel {
        characters[index]
    }
    
    func getMoreCharacters() {
        offset += Configurations.pageSize
        getCharacters()
    }
    
    func didPullToRefresh() {
        offset = 0
        characters = []
        shouldReloadPublisher.send()
        getCharacters()
    }
    
    private func didFinishRequest(withError: String? = nil) {
        self.isLoading = false
        self.shouldReloadPublisher.send()
        self.shouldStopRefresherPublisher.send()
        guard let withError else { return }
        self.showErrorMessagePublisher.send(withError)
    }
}
