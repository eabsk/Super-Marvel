import Foundation
import XCTest
import Combine
import Mockingbird
@testable import SuperMarvel

final class CharactersUCTests: XCTestCase {
    
    // MARK: - Properties -
    
    var characterUseCase: CharactersUC!
    var repositoryMock: CharacterRepositoryProtocol!
    var params: CharactersParams!
    var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Fake Data -
    
    let fakeCharacter1 = CharacterDTO(id: Int.random(in: 0..<10), name: "Spider-Man")
    let fakeCharacter2 = CharacterDTO(id: Int.random(in: 0..<10), name: "Iron Man")
    let fakeError = ServerError.network
    
    // MARK: - Setup and Teardown -
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        repositoryMock = mock(CharacterRepository.self)
        characterUseCase = DefaultCharactersUC(repository: repositoryMock)
        params = CharactersParams(offset: 0)
    }
    
    override func tearDownWithError() throws {
        characterUseCase = nil
        repositoryMock = nil
        params = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Tests -
    
    func test_execute_success() {
        // Given
        let expectation = self.expectation(description: "test_execute_success")
        var result: BaseResponseModel<CharacterDTO>!
        let expectedResponse = BaseResponseModel(code: 200,
                                                 status: "OK",
                                                 data: ResponseDataModel(offset: 0,
                                                                         limit: 2,
                                                                         total: 2,
                                                                         count: 2,
                                                                         results: [
                                                                            fakeCharacter1, fakeCharacter2
                                                                         ]))
        
        // When
        characterUseCase.execute(with: params).sink(receiveCompletion: { completion in
            switch completion {
            case .finished: ()
            case .failure(_): ()
            }
        }, receiveValue: { responseData in
            // Then
            result = responseData
            expectation.fulfill()
        }).store(in: &cancellable)
        
        waitForExpectations(timeout: 5)
        
        XCTAssertEqual(result.code, expectedResponse.code)
    }
    
}
