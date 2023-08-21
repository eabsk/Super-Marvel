import Foundation

typealias CodableEquable = Equatable & Codable

struct BaseResponseModel<T: CodableEquable>: Equatable, Codable {
    
    let code: Int?
    let status: String?
    let data: ResponseDataModel<T>?
    
    static func == (lhs: BaseResponseModel<T>, rhs: BaseResponseModel<T>) -> Bool {
        lhs.code == rhs.code &&
        lhs.data == rhs.data &&
        lhs.status == rhs.status
    }
}

struct ResponseDataModel<T: CodableEquable>: Equatable, Codable {
    let offset, limit, total, count: Int?
    let results: [T]?
    
    static func == (lhs: ResponseDataModel<T>, rhs: ResponseDataModel<T>) -> Bool {
        lhs.offset == rhs.offset &&
        lhs.limit == rhs.limit &&
        lhs.count == rhs.total &&
        lhs.count == rhs.count &&
        lhs.results == rhs.results
    }
    
}
