import UIKit

extension MainFactory {
    
    func resolveCharactersViewModel() -> CharactersViewModelProtocol {
        CharactersViewModel()
    }
    
    func resolveCharactersController(coordinator: CharactersCoordinatorProtocol) -> CharactersViewController {
        let vc = CharactersViewController()
        vc.coordinator = coordinator
        vc.viewModel = resolveCharactersViewModel()
        return vc
    }
}
