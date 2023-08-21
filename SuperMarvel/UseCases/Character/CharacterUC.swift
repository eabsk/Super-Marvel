import Combine

// MARK: - Parameters -

struct CharactersParams {
    let offset: Int
}

// MARK: - Protocol -

protocol CharactersUC {
    /// Get a list of characters from the Marvel API.
    func execute(with params: CharactersParams) -> CharactersResults
}

// MARK: - Implementation -

class DefaultCharactersUC: CharactersUC {
    
    private var repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(with params: CharactersParams) -> CharactersResults {
        repository.getCharacters(offset: params.offset)
    }
}
