import Moya
import Combine

extension MoyaProvider {
    
    func requestPromise<T: Codable> (_ target: Target) -> Future<T, ServerError> {
        
        return Future<T, ServerError> { promise in
            
            self.request(target) { result in
                
                switch result {
        
                case .success(let response):
                    
                        if response.isSuccess { // response status code is OK
                            if let serverResponse = try? JSONDecoder().decode(T.self, from: response.data) {
                                promise(.success(serverResponse))
                            } else {
                                promise(.failure(ServerError.serialization))
                            }
                        } else {
                            if let serverError = try? JSONDecoder().decode(ServerErrorDTO.self, from: response.data) {
                                promise(.failure(ServerError.message(error: serverError.message ?? "")))
                            } else {
                                promise(.failure(ServerError.serialization))
                            }
                        }
                case .failure:
                    promise(.failure(ServerError.network))
                }
            }
        }
    }
    
}
