import Combine

protocol CharactersViewModelProtocol {
    func getCharacters()
    var charactersCount: Int { get }
    func configure(cell: CharacterCollectionViewCellProtocol, index: Int)
    func didSelectCharacter(index: Int) -> CharacterModel
    var shouldReloadPublisher: PassthroughSubject<Void, Never> { get }
}

class CharactersViewModel {
    
    private var cancelAbles: Set<AnyCancellable> = []
    private let characterRepo: CharacterRepositoryProtocol = CharacterRepository()
    
    private var characters: [CharacterModel] = []
    var shouldReloadPublisher: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    func getCharacters() {
        let characters = characterRepo.getCharacters()
        characters.sink { completion in
            switch completion {
            case .finished:
                self.shouldReloadPublisher.send()
            case .failure(let error):
                debugPrint("Error:\n", error.message)
            }
        } receiveValue: { response in
            let characters = CharacterMapper.instance.mapToCharacters(characters: response.data?.results)
            self.characters = characters
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
}
