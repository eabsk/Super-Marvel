import Foundation

class ServerErrorDTO: Codable {
    let message: String?
    let code: String?
}

enum ServerError: Error {
    
    case network
    case serialization
    case general
    case noData
    case message (error: String)
    
    var message: String {
        switch self {
        case .network:
            return "Networking error"
        case .serialization:
            return  "serialization error"
        case .general:
            return  " Something went wrong"
        case .noData:
            return "No data available"
        case let .message(error):
            return error
        }
    }
    
}
