import Foundation
import Combine

class AppObservers: NSObject {
    
    struct Language {
        public static let onChangeLanguage: PassthroughSubject<Void, Never> = PassthroughSubject()
    }
    
}
