import Combine

protocol CharactersViewModelProtocol {
    func getCharacters()
}

class CharactersViewModel {

    private var cancelAbles: Set<AnyCancellable> = []
    private let characterRepo: CharacterRepositoryProtocol = CharacterRepository()

    func getCharacters() {
        let characters = characterRepo.getCharacters()
        characters.sink { completion in
            switch completion {
            case .finished:
                print("Finished")
            case .failure(let error):
                print("Error ", error.message)
            }
        } receiveValue: { response in
            let characters = CharacterMapper.instance.mapToCharacters(characters: response.data?.results)
            print(characters)
        }.store(in: &cancelAbles)
    }
}

extension CharactersViewModel: CharactersViewModelProtocol {
    
}
