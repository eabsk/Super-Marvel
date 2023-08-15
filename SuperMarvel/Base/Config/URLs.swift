import Foundation

struct URLs {
    static var plainDomain: String {
#if DEV
        return Configurations.devDomain
#elseif STAGE
        return Configurations.stagingDomain
#else
        return Configurations.productionDomain
#endif
    }
    
    static let baseURL = URLs.plainDomain + "/v1/public"
}
