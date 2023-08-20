import UIKit

private var associatedLanguageBundle: Character = "0"

class PrivateBundle: Bundle {
   static var onceToken: Int = 0
   override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {

       guard let extraB = Bundle(path: Bundle.main.path(forResource: LocalizeService.shared.selectedLanguage.rawValue, ofType: "lproj") ?? "")
       else { return "" }
       return (extraB.localizedString(forKey: key, value: value, table: tableName))
   }
}

extension Bundle {
   class func setLanguage(_ language: String) {
       if (PrivateBundle.onceToken == 0) {
           object_setClass(Bundle.main, PrivateBundle.self)
       }
       PrivateBundle.onceToken = 1
       if language == "en" {
           objc_setAssociatedObject(Bundle.main, &associatedLanguageBundle,
                                    Bundle(path: Bundle.main.path(forResource: "Base",
                                                                  ofType: "lproj") ?? ""),
                                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
       } else {
           objc_setAssociatedObject(Bundle.main, &associatedLanguageBundle,
                                    Bundle(path: Bundle.main.path(forResource: language,
                                                                  ofType: "lproj") ?? ""),
                                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
       }
       UserDefaults.standard.set([LocalizeService.shared.selectedLanguage.rawValue], forKey: "AppleLanguages")
       UserDefaults.standard.synchronize()
   }
}
// swiftlint:enable all 
