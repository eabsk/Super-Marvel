import Foundation
import Combine

protocol CharacterRepositoryProtocol: AnyObject {
    func getCharacters(offset: Int) -> CharactersResults
}

final class CharacterRepository: NSObject, CharacterRepositoryProtocol {

    private let characterRequests: CharacterRequestProtocol
    
    init(characterRequests: CharacterRequestProtocol) {
        self.characterRequests = characterRequests
    }
    
    func getCharacters(offset: Int) -> CharactersResults {
        CharacterRequest().getCharacters(offset: offset)
    }
    
}
