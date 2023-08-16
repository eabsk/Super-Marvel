import Combine

protocol CharacterRepositoryProtocol {
    func getCharacters() -> Future<BaseResponseModel<CharacterDTO>, ServerError>
}

class CharacterRepository: CharacterRepositoryProtocol {
    
    private let characterRequests: CharacterRequestProtocol = CharacterRequest()
    
    func getCharacters() -> Future<BaseResponseModel<CharacterDTO>, ServerError> {
        characterRequests.getCharacters()
    }
    
}
