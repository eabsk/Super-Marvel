// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum L10n {
  /// Message Delivered
  public static let message = { L10n.tr("NetworkErrorStrings", "Message") }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
        var frameworkBundle = Bundle(path: AppBundles.MainApp!.path(forResource: LocalizeService.shared.selectedLanguage.rawValue, ofType: "lproj") ?? "")
    if frameworkBundle == nil {
        frameworkBundle = Bundle(path: Bundle.main.path(forResource: "Base", ofType: "lproj") ?? "")
    }
    let format = NSLocalizedString(key, tableName: table,
                                   bundle: frameworkBundle ?? Bundle(for: BundleToken.self),
                                   comment: "")
    return String(format: format, arguments: args)
  }
}

private final class BundleToken: PrivateBundle {
    override init?(path: String) {
        super.init(path: AppBundles.MainApp!.path(forResource: LocalizeService.shared.selectedLanguage.rawValue, ofType: "lproj") ?? "")
    }
}
// swiftlint:enable all