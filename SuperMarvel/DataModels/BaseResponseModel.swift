import Foundation

public struct BaseResponseModel<T: Codable>: Codable {
    let code: Int?
    let status: String?
    let data: T?
}
