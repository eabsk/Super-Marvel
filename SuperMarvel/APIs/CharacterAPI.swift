import Moya

enum CharacterAPI {
    case getCharacters
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
        switch self {
        case  .getCharacters:
            return [:]
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
