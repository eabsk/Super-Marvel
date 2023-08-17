import Combine

protocol CharacterRequestProtocol {
    typealias CharactersResults = Future<BaseResponseModel<CharacterDTO>, ServerError>
    func getCharacters(offset: String) -> CharactersResults
}

final class CharacterRequest: BaseRequest<CharacterAPI>, CharacterRequestProtocol {
    
    func getCharacters(offset: String) -> CharactersResults {
        moyaProvide.request(.getCharacters(offset: offset))
    }
}
