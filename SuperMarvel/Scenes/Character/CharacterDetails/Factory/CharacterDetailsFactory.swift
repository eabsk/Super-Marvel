import UIKit

extension MainFactory {
    
    func resolveCharacterDetailsViewModel(character: CharacterModel) -> CharacterDetailsViewModelProtocol {
        CharacterDetailsViewModel(character: character)
    }
    
    func resolveCharacterDetailsController(character: CharacterModel,
                                           coordinator: CharacterDetailsCoordinatorProtocol) -> CharacterDetailsViewController {
        let vc = CharacterDetailsViewController()
        vc.coordinator = coordinator
        vc.viewModel = self.resolveCharacterDetailsViewModel(character: character)
        return vc
    }
}
