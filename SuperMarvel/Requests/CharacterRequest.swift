import Combine

protocol CharacterRequestProtocol {
    typealias CharactersResults = Future<BaseResponseModel<CharacterDTO>, ServerError>
    func getCharacters(offset: Int) -> CharactersResults
}

final class CharacterRequest: BaseRequest<CharacterAPI>, CharacterRequestProtocol {
    
    func getCharacters(offset: Int) -> CharactersResults {
        moyaProvide.request(.getCharacters(offset: offset))
    }
}
