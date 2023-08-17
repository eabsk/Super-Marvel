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
            :
        ]
    }
        
}

extension Moya.Response {
    var isSuccess: Bool {
        (200 ... 299) ~= statusCode
    }
}
