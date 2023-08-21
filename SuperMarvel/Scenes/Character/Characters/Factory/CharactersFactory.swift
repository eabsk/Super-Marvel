import UIKit

extension MainFactory {
    
    func resolveCharactersViewModel() -> CharactersViewModelProtocol {
        CharactersViewModel(charactersUC: resolveCharacterUC())
    }
    
    func resolveCharacterUC() -> CharactersUC {
        DefaultCharactersUC(repository: resolveCharacterRepo())
    }
    
    func resolveCharacterRepo() -> CharacterRepositoryProtocol {
        CharacterRepository(characterRequests: CharacterRequest())
    }

    func resolveCharactersController(coordinator: CharactersCoordinatorProtocol) -> CharactersViewController {
        let vc = CharactersViewController()
        vc.coordinator = coordinator
        vc.viewModel = resolveCharactersViewModel()
        return vc
    }
}
