import Combine

protocol CharactersViewModelProtocol {
    func getCharacters()
    var charactersCount: Int { get }
    var totalCharactersCount: Int { get }
    var shouldReloadPublisher: PassthroughSubject<Void, Never> { get }
    var showErrorMessagePublisher: PassthroughSubject<String, Never> { get }
    var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
    func configure(cell: CharacterCollectionViewCellProtocol, index: Int)
    func didSelectCharacter(index: Int) -> CharacterModel
   func getMoreCharacters()
}

class CharactersViewModel {
    
    private var cancelAbles: Set<AnyCancellable> = []
    private let characterRepo: CharacterRepositoryProtocol = CharacterRepository()
    
    private var characters: [CharacterModel] = []
    private(set) var totalCharactersCount: Int = 0
    var shouldReloadPublisher: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    var showErrorMessagePublisher: PassthroughSubject<String, Never> = PassthroughSubject()

    @Published private var isLoading: Bool = false
    var isLoadingPublisher: AnyPublisher<Bool, Never> {
        $isLoading.eraseToAnyPublisher()
    }

    private var offset = 0
    
    func getCharacters() {
        isLoading = true
        let characters = characterRepo.getCharacters(offset: offset)
        characters.sink { completion in
            switch completion {
            case .finished:
                self.shouldReloadPublisher.send()
                self.isLoading = false
            case .failure(let error):
                self.isLoading = false
                self.showErrorMessagePublisher.send(error.message)
            }
        } receiveValue: { response in
            self.totalCharactersCount = response.data?.total ?? 0
            let characters = CharacterMapper.instance.mapToCharacters(characters: response.data?.results)
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
}
