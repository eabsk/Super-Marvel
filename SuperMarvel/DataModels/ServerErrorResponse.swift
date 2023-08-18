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
            return L10n.NetworkErrorStrings.connectionError()
        case .serialization:
            return  L10n.NetworkErrorStrings.serializationError()
        case .general:
            return  L10n.NetworkErrorStrings.somethingWentWrong()
        case .noData:
            return L10n.NetworkErrorStrings.noDataAvailable()
        case let .message(error):
            return error
        }
    }
    
}
