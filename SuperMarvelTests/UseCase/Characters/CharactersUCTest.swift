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
            XCTAssertEqual(responseData, expectedResponse)
        }).store(in: &cancellable)
        
    }
    
    func test_execute_failure() {
        // When
        characterUseCase.execute(with: params).sink(receiveCompletion: { completion in
            switch completion {
                
            case .finished: ()
            case .failure(let error):
                // Then
                XCTAssertEqual(error, self.fakeError)
            }
        }, receiveValue: { _ in
        }).store(in: &cancellable)
    }
    
    func test_execute_pagination() {
        // Given
        let expectedResponse1 = BaseResponseModel(code: 200,
                                                  status: "OK",
                                                  data: ResponseDataModel(offset: 0,
                                                                          limit: 2,
                                                                          total: 4,
                                                                          count: 2,
                                                                          results: [
                                                                            fakeCharacter1, fakeCharacter2
                                                                          ]))
        
        let expectedResponse2 = BaseResponseModel(code: 200,
                                                  status: "OK",
                                                  data: ResponseDataModel(offset: 2,
                                                                          limit: 2,
                                                                          total: 4,
                                                                          count: 2,
                                                                          results: [
                                                                            fakeCharacter1, fakeCharacter2
                                                                          ]))
        // When
        characterUseCase.execute(with: CharactersParams(offset: 0))
            .sink(receiveCompletion: { _ in }, receiveValue: { responseData in
                // Then
                XCTAssertEqual(responseData, expectedResponse1)
            }).store(in: &cancellable)
        
        // When
        characterUseCase.execute(with: CharactersParams(offset: 2))
            .sink(receiveCompletion: { _ in }, receiveValue: { responseData in
                // Then
                XCTAssertEqual(responseData, expectedResponse2)
            }).store(in: &cancellable)
    }
    
}
