import Foundation

struct BaseResponseModel<T: Codable>: Codable {
    let code: Int?
    let status: String?
    let data: ResponseDataModel<T>?
}

struct ResponseDataModel<T: Codable>: Codable {
    let offset, limit, total, count: Int?
    let results: [T]?
}
