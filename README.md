# Example source code to integrate with VNPTSmartCA iOS SDK

To run the example project, clone repository, and run `pod install`

## Requirements

### Installation

VNPT SmartCA iOS SDK is available through [CocoaPods](https://cocoapods.org/). To install it, simply add the following line to your Podfile.

```ruby
pod 'VNPTSmartCAiOSSDK', '~>1.0.0'
```

At a minimum, VNPT SmartCA iOS SDK is designed to work with iOS 9.0 or the newest.

### Configure Steps

Step 1: Config file pList

```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLName</key>
    <string></string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>partnerId03</string>
    </array>
  </dict>
</array>
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>vnptsmartca</string>
  <string>vnptsmartcademo</string>
</array>
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
</dict>
```

## Author

VNPT SmartCA Development Team

## License

VNPT SmartCA iOS SDK is licensed under [The MIT license](https://github.com/VNPTSmartCA/ios-sdk-example/blob/master/LICENSE).
