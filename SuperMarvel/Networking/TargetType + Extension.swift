import Moya
import ArkanaKeys

extension TargetType {
    
    var defaultParameters: [String: Any]? {
        [
            "apikey": ArkanaKeys.Keys.Global().marvelPublicKey,
            "ts": ArkanaKeys.Keys.Global().marvelTimeStamp,
            "hash": ArkanaKeys.Keys.Global().marvelHashKey
        ]
    }
    
    var baseURL: URL {
        
        guard let url = URL(string: URLs.versionPath)
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
        defaultParameters
    }
}

extension Moya.Response {
    var isSuccess: Bool {
        (200 ... 299) ~= statusCode
    }
}
