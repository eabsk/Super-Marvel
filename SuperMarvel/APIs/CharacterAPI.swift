import Moya

enum CharacterAPI {
    case getCharacters(offset: Int)
}

extension CharacterAPI: TargetType {
    
    var path: String {
        switch self {
        case .getCharacters: return UrlPath.characters.rawValue
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCharacters: return .get
        }
    }
    
    var parameters: [String: Any]? {
        var params: [String: Any] = defaultParameters ?? [:]
        switch self {
        case .getCharacters(let offset):
            params["offset"] = offset
            params["limit"] = Configurations.pageSize
            return params
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getCharacters: return URLEncoding.queryString
        }
    }
    
    var task: Task {
        if let parameters {
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        } else {
            return .requestPlain
        }
    }
}
