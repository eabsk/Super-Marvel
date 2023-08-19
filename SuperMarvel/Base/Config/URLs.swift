import Foundation

struct URLs {
    
    // MARK: - Base Domain
    static var plainDomain: String {
        let urlDomainKey = "SERVER_URL"
        if let path = AppBundles.MainApp?.path(forResource: "Info", ofType: "plist"),
        let dictionary = NSDictionary(contentsOfFile: path) {
                return dictionary[urlDomainKey] as? String ?? ""
        }
        return ""
    }
    
    static let versionPath = URLs.plainDomain + "/v1/public"
}
