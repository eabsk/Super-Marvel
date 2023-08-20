fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios install_certificates

```sh
[bundle exec] fastlane ios install_certificates
```

install app certificates

### ios auto_increment_build_number

```sh
[bundle exec] fastlane ios auto_increment_build_number
```

increment build number

### ios pilot_testflight

```sh
[bundle exec] fastlane ios pilot_testflight
```

launch build on testflight

### ios upload_marvel_development

```sh
[bundle exec] fastlane ios upload_marvel_development
```

upload marvel-development-app

### ios upload_marvel_testing

```sh
[bundle exec] fastlane ios upload_marvel_staging
```

upload marvel-staging-app

### ios upload_marvel_production

```sh
[bundle exec] fastlane ios upload_marvel_production
```

upload marvel-production-app

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
