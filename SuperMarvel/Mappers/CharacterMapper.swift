import Foundation

class CharacterMapper {
    
    static let instance = CharacterMapper()
    private init() {}
    
    func mapToCharacters(characters: [CharacterDTO]?) -> [CharacterModel] {
        characters?.compactMap { character in
            CharacterModel(id: character.id ?? 0,
                           name: character.name ?? "",
                           description: character.description ?? "",
                           modified: character.modified ?? "",
                           image: character.imageUrlPath)
        } ?? []
    }
}
