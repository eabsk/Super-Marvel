import Combine

protocol CharacterRequestProtocol {
    func getCharacters() -> Future<BaseResponseModel<CharacterDTO>, ServerError>
}

final class CharacterRequest: BaseRequest<CharacterAPI>, CharacterRequestProtocol {
    
    func getCharacters() -> Future<BaseResponseModel<CharacterDTO>, ServerError> {
        moyaProvide.request(.getCharacters)
    }
}
