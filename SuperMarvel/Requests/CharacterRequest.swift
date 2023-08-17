import Combine

protocol CharacterRequestProtocol {
    typealias CharactersResults = Future<BaseResponseModel<CharacterDTO>, ServerError>
    func getCharacters() -> CharactersResults
}

final class CharacterRequest: BaseRequest<CharacterAPI>, CharacterRequestProtocol {
    
    func getCharacters() -> CharactersResults {
        moyaProvide.request(.getCharacters)
    }
}
