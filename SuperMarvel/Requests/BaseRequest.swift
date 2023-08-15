import Moya

class BaseRequest<T: TargetType>: NSObject {
        
    lazy var moyaProvide: MoyaProvider<T> = {
        return MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])
    }()
    
}
