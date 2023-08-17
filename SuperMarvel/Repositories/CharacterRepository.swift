import Combine

protocol CharacterRepositoryProtocol {
    typealias CharactersResults = Future<BaseResponseModel<CharacterDTO>, ServerError>
    func getCharacters(offset: String) -> CharactersResults
}

class CharacterRepository: CharacterRepositoryProtocol {
    
    private let characterRequests: CharacterRequestProtocol = CharacterRequest()
    
    func getCharacters(offset: String) -> CharactersResults {
        characterRequests.getCharacters(offset: offset)
    }
    
}
