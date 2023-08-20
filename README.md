<p align="center">
    <img src="https://1000logos.net/wp-content/uploads/2021/06/Marvel-Comics-logo.png" alt="Logo" width=400 height=200>
</p>
  <h1 align="center">Super-Marvel 🚀</h1> 
  <p align="center">
<a href="https://www.youtube.com/watch?v=OKXaDq307LM" rel="nofollow"><img src="https://camo.githubusercontent.com/082ddbfd956a5dd61cf444a43be80704940726d6f5eec80f8e0d894348d26219/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f796f75747562652d2532334646303030303f7374796c653d666c6174266c6f676f3d796f7574756265266c6f676f436f6c6f723d7768697465" data-canonical-src="https://img.shields.io/badge/youtube-%23FF0000?style=flat&amp;logo=youtube&amp;logoColor=white" style="max-height: 100%;"></a>
<a href="https://github.com/eabsk/Super-Marvel/blob/master/LICENSE">
<img src="https://img.shields.io/github/license/aagarwal1012/animated-text-kit?color=red"
alt="License: MIT" />
</a>

<br>
Super-Marvel is an iOS app that uses the Marvel API to display a list of Marvel characters and their details. You can browse through hundreds of heroes and villains from the Marvel universe, see their comics, and learn more about their powers and abilities.
 <br>
 <br>
This app is created as a personal project to showcase my skills and passion for iOS development. This app demonstrates how to implement Clean Architecture and some of the best practices for iOS app development using UIKIt, Combine, MVVM-C, SwiftLint, SwiftGen, and more.
    <br>
    <a href="https://github.com/eabsk/Super-Marvel/issues/new">Report bug</a>
    ·
    <a href="https://github.com/eabsk/Super-Marvel/issues/new">Request feature</a>
<br>
</p>

<!-- TOC -->
  * [Video](https://www.youtube.com/watch?v=OKXaDq307LM)
  * [Screenshots](#screenshots)
  * [Setup](#setup)
  * [Marvel APIs](#marvel-apis)
  * [Folder Structure](#folder-structure)
  * [Tools & Frameworks Used](#tools--frameworks-used)
  * [Upcoming Features](#upcoming-features)
  * [Development Environment](#development-environment)
  * [License](#license)
<!-- TOC -->

## Screenshots
<img src="https://imgur.com/x2GpoJc.png" alt="Light Splash"  height=350>  &nbsp; <img src="https://imgur.com/WWnoPKD.png" alt="Light Home" height=350> &nbsp; <img src="https://imgur.com/hDhmPKy.png" alt="Dark Home"  height=350> &nbsp; <img src="https://imgur.com/L6av6tp.png" alt="Dark Character Profile" height=350> &nbsp; <img src="https://imgur.com/e290qe6.png" alt="Light Character Profile"  height=350>

## Setup
It's recommended that all team members work on a project depending on ruby & ruby gems to have the same project setup in order to avoid any version conflicts and to avoid inconvenience issues.
so please everyone, follow the following steps to make sure you have the appropriate setup for the project.

1. **Ruby**
   If you use macOS, system Ruby is not recommended. There is a variety of ways to install Ruby without having to modify your system    environment. For macOS and Linux, [**rbenv**](https://github.com/rbenv/rbenv) is one of the most popular ways to manage your Ruby    environment. It's recommended to install [**rbenv**](https://github.com/rbenv/rbenv) via [**HomeBrew**](https://brew.sh).
 Install Ruby 2.7.6 by running:
    ```shell
    rbenv install 2.7.6
    ```
   the app supports Ruby versions 2.7.6 or newer. Verify which Ruby version you're using:
    ```shell
    ruby --version
    ```
    result for example-> $ ruby 2.7.6p137 (2022-02-01 revision 5445e04352) [x86_64-darwin19]

3. **Bundler**
   It is recommended that you use [**Bundler**](http://bundler.io) and Gemfile to define the dependency of the app.
   <br>Install Bundler by running:
    ```shell
    gem install bundler
    ```
4. Install Ruby Gems `in the project directory` by running:
    ```shell
    bundle install
    ```
    `Note: Try to restart the terminal and open it in the project directory again if you can't install the gems`
5. [Arkana](https://github.com/rogerluan/arkana) Environment file<br>
   Create a file called `.env` in the root directory of the project and add the following lines to
   it:
    ```shell
    MarvelPrivateKey=your_private_key
    MarvelPublicKey=your_public_key
    MarvelHashKey=make_hash_by_MD5
    MarvelTimeStamp=current_time_stamp
    ```
    `To get your own keys, look at` [Marvel APIs](#marvel-apis) to start using **Marvel APIs** Keys.
   
6. Run the following command to generate the [ArkanaKeys](https://github.com/rogerluan/arkana) local
   package that will be used to securely
   fetch your keys in runtime:
    ```shell
    bin/arkana
    ``` 

7. Cocoapods Installation `in the project directory` by running:
    ```shell
    bundle exec pod install
    ```
8. [Fastlane](https://docs.fastlane.tools/getting-started/ios/setup/) (Configured)

## Marvel APIs
As this project uses the Marvel API, you need to get your own API keys to run the project. You can
get them by following these steps:

1. Go to the [Marvel Developer Portal](https://developer.marvel.com/) and create an account.
2. Once you have an account, go to the [Get a Key](https://developer.marvel.com/account) page and
   get your public and private keys.

## Folder Structure

```markdown
📦SuperMarvel
┣ 📂AppSchems
┣ 📂Core
┃ 📂Extensions
┣ 📂DataModels
┃ ┣ 📂Mappers
┃ ┣ 📂Character
┣ 📂Networking
┣ 📂APIs
┣ 📂Requests
┃ 📂Repositories
┣ 📂Base
┃ ┣ 📂Config
┃ ┣ 📂Wrappers
┃ ┣ 📂TypeAlias
┃ ┣ 📂Services
┃ ┗ 📂Observers
┣ 📂Coordinators
┃ ┣ 📂Base
┣ 📂Scenes
┃ ┣ 📂Splash
┃ ┣ 📂Character
┃ ┃ ┃ ┣ 📂Characters
┃ ┃ ┃ ┗ 📂CharacterDetails
┣ 📂Extensions
┣ 📂Localize
┣ 📂Assets
┣ 📂Helpers
┃ ┣ 📂Toast
┣ 📂SupportFiles
┗ 📜SuperMarvelApp.swift => The app entry point.
```

## Tools & Frameworks Used

| Tool                                                                                                  | Used for                                                             |
|-------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| [SwifGen](https://github.com/SwiftGen/SwiftGen)                                                       | tool to automatically generate Swift code for resources of your projects                                                 |
| [Arkana](https://github.com/rogerluan/arkana)                                                         | Securely storing secrets and keys                                    |
| [Kingfisher](https://github.com/onevcat/Kingfisher)                                                                  | Image Loading & Caching                                              |
| [SwiftLint](https://github.com/realm/SwiftLint)                                                       | Code Linting                                                         |
| [Moya](https://github.com/Moya/Moya)                                                       | Networking Layer tool                                               |
| [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView)                                                       | collection of awesome loading animations                                                         |
| [L10-Swift](https://github.com/Decybel07/L10n-swift)                                                       | improves localization in swift app, providing cleaner syntax and in-app language switching.                                                         |
| [Mockingbird](https://github.com/birdrides/mockingbird)                                               | Generating mock, stub, and verify objects in Swift unit tests        |

## Upcoming Features
* Integrate with **Fastlane** with **Bitrise**
* CI/CD using [GitHub Actions](https://docs.github.com/en/actions) & [Bitrise](https://bitrise.io)
* UI Testing
* Integrate with [Sentry](https://sentry.io) & [codecov](https://about.codecov.io)

## Development Environment

![Swift Badge](https://img.shields.io/badge/MADE%20WITH-SWIFT-red?style=for-the-badge&logo=swift)

* Xcode 14.3.1
* Swift 5.8
* iOS Deployment Target 13.0
* Ruby Version 2.7.6
* Coocapods 1.12.1
  
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

