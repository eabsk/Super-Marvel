import Moya

extension TargetType {
    
    var baseURL: URL {
        
        guard let url = URL(string: URLs.baseURL) else {
            fatalError("invalid error message")
        }
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
            "apikey": "",
            "ts": "1691528326",
            "hash": ""
        ]
    }
    
    var sampleData: Data { return Data() }
    
}

extension Moya.Response {
    var isSuccess: Bool {
        (200 ... 299) ~= statusCode
    }
}
