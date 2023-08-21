//
//  CharacterRepoTest.swift
//  SuperMarvelTests
//
//  Created by Eslam Abdelmaqsoud on 21/08/2023.
//

import XCTest
import Mockingbird
import Combine
@testable import SuperMarvel

final class CharactersRepositoryTests: XCTestCase {
    
    // MARK: - Properties -
    
    var characterRepo: CharacterRepository!
    var dataSourceMock: CharacterRequestProtocol!
    
    // MARK: - Fake Data -
    
    let fakeResponse = BaseResponseModel(code: 200,
                                         status: "OK",
                                         data: ResponseDataModel(offset: 2,
                                                                 limit: 2,
                                                                 total: 2,
                                                                 count: 2,
                                                                 results: [
                                                                    CharacterDTO(id: 1, name: "X-Man")
                                                                 ]))
    
    let fakeError = ServerError.network
    
    // MARK: - Setup and Teardown -
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        dataSourceMock = mock(CharacterRequest.self)
        characterRepo = CharacterRepository(characterRequests: dataSourceMock)
    }
    
    override func tearDownWithError() throws {
        characterRepo = nil
        dataSourceMock = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Tests -
    //
    func get_characters() {
        // Given
        let dataResponse = dataSourceMock.getCharacters(offset: any())
        let promise = CharactersResults { promise in
            return promise(.success(self.fakeResponse))
        }
        given(dataResponse).willReturn(promise)
        
        // When
        let result = characterRepo.getCharacters(offset: 0).assertNoFailure()
        
        // Then
        XCTAssertNoThrow(result.assertNoFailure())
    }
}
