import Combine

protocol CharacterRepositoryProtocol {
    typealias CharactersResults = Future<BaseResponseModel<CharacterDTO>, ServerError>
    func getCharacters(offset: Int) -> CharactersResults
}

class CharacterRepository: CharacterRepositoryProtocol {
    
    private let characterRequests: CharacterRequestProtocol = CharacterRequest()
    
    func getCharacters(offset: Int) -> CharactersResults {
        characterRequests.getCharacters(offset: offset)
    }
    
}
