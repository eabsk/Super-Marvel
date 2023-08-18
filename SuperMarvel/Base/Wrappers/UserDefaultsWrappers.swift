// swiftlint:disable all
import Foundation

@propertyWrapper
struct UserDefault<Value: Codable> {
    let key: String
    let defaultValue: Value
    let container: UserDefaults = .standard
    
    var wrappedValue: Value {
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
    enum Keys {
        public static let selectedLanguageKey = "SELECTED_LANGUAGE"
    }
    
    // MARK: - selected Language
    @UserDefault(key: UserDefaults.Keys.selectedLanguageKey, defaultValue: "en")
    static var selectedLanguage: String?
    
}

// swiftlint:enable all
