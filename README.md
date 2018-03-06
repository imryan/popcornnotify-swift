# 🍿 PopcornNotify

[![CI Status](http://img.shields.io/travis/imryan/PopcornNotify.svg?style=flat)](https://travis-ci.org/imryan/PopcornNotify)
[![Version](https://img.shields.io/cocoapods/v/PopcornNotify.svg?style=flat)](http://cocoapods.org/pods/PopcornNotify)
[![License](https://img.shields.io/cocoapods/l/PopcornNotify.svg?style=flat)](http://cocoapods.org/pods/PopcornNotify)
[![Platform](https://img.shields.io/cocoapods/p/PopcornNotify.svg?style=flat)](http://cocoapods.org/pods/PopcornNotify)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* Has no dependencies!

## Installation

PopcornNotify is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PopcornNotify'
```

## Usage

```swift
// Setup PopcornNotify with API key
let notify = PopcornNotify(withAPIkey: "api:key")

// Notify!
notify.notify(recipients: "notryancohen@gmail.com", "2125551234", 
                 message: "Hello, world!", subject: "Hello") { (error) in

    if let error = error {
        print("Error:", error.localizedDescription)
    }
}
```

## Author

Ryan Cohen, notryancohen@gmail.com

## License

PopcornNotify is available under the MIT license. See the LICENSE file for more info.
