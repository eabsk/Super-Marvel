import Moya

extension TargetType {
    
    var baseURL: URL {
        
        guard let url = URL(string: URLs.baseURL)
        else { fatalError("invalid url") }
        return url
    }
    
    var headers: [String: String]? {
        
        let headers = [
            "accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        return headers
    }
    
    var parameters: [String: Any]? {
        [
            "apikey": "e959b603bcec131723e4e651784ad340",
            "ts": "1691528326",
            "hash": "2e25bc2d763f933b6f616bd4d0b76023"
        ]
    }
        
}

extension Moya.Response {
    var isSuccess: Bool {
        (200 ... 299) ~= statusCode
    }
}
