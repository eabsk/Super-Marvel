# Uncomment the next line to define a global platform for your project
source 'https://github.com/cocoaPods/Specs.git'
platform :ios, '13.0'

target 'SuperMarvel' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SuperMarvel
 
    # Utilities
    pod 'SwiftLint'
    pod 'SwiftGen', '~> 6.0'
    pod 'NVActivityIndicatorView'
    pod 'L10n-swift', '~> 5.6'

    # Networking
    pod 'Moya', '~> 15.0'
    pod 'Kingfisher', '~> 7.0'
    # Protecting Keys
    pod "ArkanaKeys", path: "ArkanaKeys/ArkanaKeys"
    pod "ArkanaKeysInterfaces", path: "ArkanaKeys/ArkanaKeysInterfaces"

  target 'SuperMarvelTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'MockingbirdFramework', '~> 0.20'

  end

  target 'SuperMarvelUITests' do
    # Pods for testing
  end

end
