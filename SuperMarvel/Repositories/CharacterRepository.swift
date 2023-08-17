import Combine

protocol CharacterRepositoryProtocol {
    typealias CharactersResults = Future<BaseResponseModel<CharacterDTO>, ServerError>
    func getCharacters() -> CharactersResults
}

class CharacterRepository: CharacterRepositoryProtocol {
    
    private let characterRequests: CharacterRequestProtocol = CharacterRequest()
    
    func getCharacters() -> CharactersResults {
        characterRequests.getCharacters()
    }
    
}
