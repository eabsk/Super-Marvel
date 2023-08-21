import UIKit

extension MainFactory {
    
    func resolveCharactersViewModel() -> CharactersViewModelProtocol {
        CharactersViewModel(charactersUC: resolveCharacterUC())
    }
    
    func resolveCharacterUC() -> any CharactersUC {
        DefaultCharactersUC(repository: CharacterRepository())
    }

    func resolveCharactersController(coordinator: CharactersCoordinatorProtocol) -> CharactersViewController {
        let vc = CharactersViewController()
        vc.coordinator = coordinator
        vc.viewModel = resolveCharactersViewModel()
        return vc
    }
}
