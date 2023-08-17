import Foundation

protocol CharacterDetailsViewModelProtocol {
    func configure(cell: CharacterHeaderCellViewProtocol)
    func configure(cell: CharacterDescriptionTableCellProtocol)
    func configure(cell: CharacterCollectionsTableCellProtocol)
}

class CharacterDetailsViewModel {
    var character: CharacterModel
    
    init(character: CharacterModel) {
        self.character = character
    }
}

extension CharacterDetailsViewModel: CharacterDetailsViewModelProtocol {
    
    func configure(cell: CharacterHeaderCellViewProtocol) {
        cell.configure(name: character.name, imagePath: character.image)
    }
    
    func configure(cell: CharacterDescriptionTableCellProtocol) {
        cell.characterDescription = character.description
    }
    
    func configure(cell: CharacterCollectionsTableCellProtocol) {
        cell.comics = character.comics
        cell.series = character.series
        cell.stories = character.stories
    }
}
