// swiftlint:disable all
import Foundation

@propertyWrapper
public struct UserDefault<Value: Codable> {
    let key: String
    let defaultValue: Value
    let container: UserDefaults = .standard
    
    public var wrappedValue: Value {
        get {
            if let data = container.data(forKey: key) {
                let decoder = JSONDecoder()
                return try! decoder.decode(Value.self, from: data)
            } else {
                return defaultValue
            }
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                container.set(encoded, forKey: key)
            }
        }
    }
}

extension UserDefaults {
   public enum Keys {
       public static let isFirstLoad = "IS_FIRST_LOAD"
       public static let accessTokenKey = "ACCESS_TOKEN"
       public static let selectedLanguageKey = "SELECTED_LANGUAGE"
    }
    
    // MARK: - access Token
    @UserDefault(key: UserDefaults.Keys.accessTokenKey, defaultValue: "")
    public static var accessToken: String
    
    // MARK: - is First Load
    @UserDefault(key: UserDefaults.Keys.isFirstLoad, defaultValue: true)
    public static var isFirstLoad: Bool
    
    // MARK: - selected Language
    @UserDefault(key: UserDefaults.Keys.selectedLanguageKey, defaultValue: "en")
    public static var selectedLanguage: String?
 
}

// swiftlint:enable all
