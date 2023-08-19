// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum L10n {
  public enum AppSettingsStr {
    /// English
    public static let english = { L10n.tr("AppSettingsStr", "English") }
    /// Spanish
    public static let spanish = { L10n.tr("AppSettingsStr", "Spanish") }
  }
  public enum AppSettingsStr2 {
    /// English
    public static let english = { L10n.tr("AppSettingsStr 2", "English") }
    /// Spanish
    public static let spanish = { L10n.tr("AppSettingsStr 2", "Spanish") }
  }
  public enum CharacterStr {
    /// Comics
    public static let comics = { L10n.tr("CharacterStr", "Comics") }
    /// Marvel Characters
    public static let marvelCharacters = { L10n.tr("CharacterStr", "Marvel Characters") }
    /// Series
    public static let series = { L10n.tr("CharacterStr", "Series") }
    /// Stories
    public static let stories = { L10n.tr("CharacterStr", "Stories") }
  }
  public enum CharacterStr2 {
    /// Comics
    public static let comics = { L10n.tr("CharacterStr 2", "Comics") }
    /// Marvel Characters
    public static let marvelCharacters = { L10n.tr("CharacterStr 2", "Marvel Characters") }
    /// Series
    public static let series = { L10n.tr("CharacterStr 2", "Series") }
    /// Stories
    public static let stories = { L10n.tr("CharacterStr 2", "Stories") }
  }
  public enum NetworkErrorStrings {
    /// Connection error
    public static let connectionError = { L10n.tr("NetworkErrorStrings", "Connection error") }
    /// No data available
    public static let noDataAvailable = { L10n.tr("NetworkErrorStrings", "No data available") }
    /// serialization error
    public static let serializationError = { L10n.tr("NetworkErrorStrings", "serialization error") }
    /// Something went wrong
    public static let somethingWentWrong = { L10n.tr("NetworkErrorStrings", "Something went wrong") }
  }
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