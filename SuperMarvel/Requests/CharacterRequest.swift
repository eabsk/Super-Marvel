import Combine

protocol CharacterRequestProtocol {
    func getCharacters(offset: Int) -> CharactersResults
}

final class CharacterRequest: BaseRequest<CharacterAPI>, CharacterRequestProtocol {
    
    func getCharacters(offset: Int) -> CharactersResults {
        moyaProvide.request(.getCharacters(offset: offset))
    }
}
