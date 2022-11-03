# AutoChangeable
[![Build Status](https://github.com/almazrafi/AutoChangeable/workflows/CI/badge.svg?branch=main)](https://github.com/almazrafi/AutoChangeable/actions)
[![Codecov](https://codecov.io/gh/almazrafi/AutoChangeable/branch/master/graph/badge.svg)](https://codecov.io/gh/almazrafi/AutoChangeable)
[![Cocoapods](https://img.shields.io/cocoapods/v/AutoChangeable)](http://cocoapods.org/pods/AutoChangeable)
[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-brightgreen)](https://github.com/Carthage/Carthage)
[![SPM compatible](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![Platforms](https://img.shields.io/cocoapods/p/AutoChangeable)](https://developer.apple.com/discover/)
[![Xcode](https://img.shields.io/badge/Xcode-12-blue)](https://developer.apple.com/xcode)
[![Swift](https://img.shields.io/badge/Swift-5.1-orange)](https://swift.org)
[![License](https://img.shields.io/github/license/almazrafi/AutoChangeable)](https://opensource.org/licenses/MIT)

AutoChangeable is a simple library that provides a convenient way to copy instances of Swift types with changed properties:

```swift
struct User: AutoChangeable {
    let id: Int
    let name: String
    let age: Int
}

let steve = User(id: 1, name: "Steve", age: 21)

// Copy the instance by changing the `name` and `age` properties
let steveJobs = steve.changing { newUser in
    newUser.name = "Steve Jobs"
    newUser.age = 41
}
```

## Requirements
- iOS 10.0+ / macOS 10.12+ / watchOS 3.0+ / tvOS 10.0+
- Xcode 12.5+
- Swift 5.1+

## Usage
The most convenient way to use AutoChangeable is to configure [code generation](#code-generation)
and conform your structs to the `AutoChangeable` protocol:

```swift
struct User: AutoChangeable {
    let id: Int
    let name: String
    let age: Int
}
```

If you don't want to configure code generation,
you just need to implement initialization from a copy **manually**:

```swift
extension User: Changeable {
    init(copy: ChangeableWrapper<Self>) {
        self.init(
            id: copy.id,
            name: copy.name,
            age: copy.age
        )
    }
}
```

## Installation
### CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:
```bash
$ gem install cocoapods
```

To integrate AutoChangeable into your Xcode project using [CocoaPods](http://cocoapods.org), specify it in your `Podfile`:
```ruby
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'AutoChangeable'
end
```

Finally run the following command:
```bash
$ pod install
```

### Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. You can install Carthage with Homebrew using the following command:
```bash
$ brew update
$ brew install carthage
```

To integrate AutoChangeable into your Xcode project using Carthage, specify it in your `Cartfile`:
```ogdl
github "almazrafi/AutoChangeable" ~> 1.0.1
```

Finally run `carthage update` to build the framework and drag the built `AutoChangeable.framework` into your Xcode project.

### Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate AutoChangeable into your Xcode project using Swift Package Manager,
add the following as a dependency to your `Package.swift`:
```swift
.package(url: "https://github.com/almazrafi/AutoChangeable.git", from: "1.0.1")
```
and then specify `"AutoChangeable"` as a dependency of the Target in which you wish to use AutoChangeable.

Here's an example `Package.swift`:
```swift
// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "MyPackage",
    products: [
        .library(name: "MyPackage", targets: ["MyPackage"])
    ],
    dependencies: [
        .package(url: "https://github.com/almazrafi/AutoChangeable.git", from: "1.0.1")
    ],
    targets: [
        .target(name: "MyPackage", dependencies: ["AutoChangeable"])
    ]
)
```

## Code Generation
To generate code for the `AutoChangeable` protocol, the first thing you need to do
is to install the [Sourcery](https://github.com/krzysztofzablocki/Sourcery) command line tool.

You can use a ready-made [Stencil](https://github.com/stencilproject/Stencil)-template for Sourcery,
which can be downloaded from the latest release files
on the [repository releases page](https://github.com/almazrafi/AutoChangeable/releases).

If AutoChangeable is installed using CocoaPods, it already contains this template
and a helper script for generating code.
You can either run it manually or in a custom build phase using the following command:

``` sh
Pods/AutoChangeable/Bin/AutoChangeable \
--sources Path/to/yours/sources \
--output Path/to/generated/file
```

## Communication
- If you need help, open an issue.
- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request.

## License
AutoChangeable is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
