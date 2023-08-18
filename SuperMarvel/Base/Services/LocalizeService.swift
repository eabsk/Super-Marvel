import Foundation
import UIKit

public class LocalizeService {
    
    enum Language: String {
        case english = "en"
        case arabic = "ar"
        case spanish = "es"
        
        var locale: String {
            switch self {
            case .english: return "en-US"
            case .arabic: return "ar-SA"
            case .spanish: return "es_ES"
            }
        }
        
        var title: String {
            switch self {
            case .english: return "English"
            case .arabic: return "العربية"
            case .spanish: return "Española"
            }
        }
    }
    
    static var shared: LocalizeService = {
        return LocalizeService()
    }()
    
    private (set) var deviceLanguage: Language
    var selectedLanguage: LocalizeService.Language
    
    private init() {
        
        let deviceLanguageString = Bundle.main.preferredLocalizations.first ?? "en"
        if deviceLanguageString.contains(Language.arabic.rawValue) {
            self.deviceLanguage = LocalizeService.Language.arabic
        } else if deviceLanguageString.contains(Language.english.rawValue) {
            self.deviceLanguage = LocalizeService.Language.english
        } else {
            self.deviceLanguage = LocalizeService.Language.spanish
        }
        self.selectedLanguage = self.deviceLanguage
    }
    
    func startService() {
        self.setLanguage(self.selectedLanguage)
    }
    
    var isRTL: Bool {
        self.isArabic
    }
    
    var isArabic: Bool {
        return self.selectedLanguage == LocalizeService.Language.arabic
    }
    
    var isTheSameDeviceLanguage: Bool {
        return self.deviceLanguage == self.selectedLanguage
    }
    
    func setLanguage(_ language: Language) {
        self.selectedLanguage = language
        Bundle.setLanguage(self.selectedLanguage.rawValue)
        UserDefaults.selectedLanguage = self.selectedLanguage.rawValue
        AppObservers.Language.onChangeLanguage.send()
        resetApp()
    }
    
    func resetApp() {
        let semantic: UISemanticContentAttribute = isRTL ? .forceRightToLeft : .forceLeftToRight
        UITabBar.appearance().semanticContentAttribute = semantic
        UIView.appearance().semanticContentAttribute = semantic
        UINavigationBar.appearance().semanticContentAttribute = semantic
        UICollectionView.appearance().semanticContentAttribute = semantic
        UILabel.appearance().semanticContentAttribute = semantic
        UITextView.appearance().semanticContentAttribute = semantic
        UITextField.appearance().semanticContentAttribute = semantic
    }
}
