import Combine

// MARK: - Parameters -

struct CharactersParams {
    let offset: Int
}

// MARK: - Protocol -

protocol CharactersUC {
    typealias CharactersResults = Future<BaseResponseModel<CharacterDTO>, ServerError>
    /// Get a list of characters from the Marvel API.
    func execute(with params: CharactersParams) -> CharactersResults
}

// MARK: - Implementation -

class DefaultCharactersUC: CharactersUC {
    
    private var repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepository) {
        self.repository = repository
    }
    
    func execute(with params: CharactersParams) -> CharactersResults {
        repository.getCharacters(offset: params.offset)
    }
    
}
