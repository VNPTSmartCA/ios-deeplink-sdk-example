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

***Step 1: Config file pList***

```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLName</key>
    <string></string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>partnerSchemeId</string>
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

- ***CFBundleURLTypes***: Add scheme value. Note: *partnerSchemeId* provided by VNPT SmartCA. It's clientId.
- ***LSApplicationQueriesSchemes***: Add the scheme as *vnptsmartca* and *vnptsmartcademo*.

***Step 2: Import SDK in AppDelegate instance***

```swift
func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    VNPTSmartCATransaction.receiveBackLink(url: url, sourceApp: sourceApplication!)
    return true
}

func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
    VNPTSmartCATransaction.receiveBackLink(url: url, sourceApp: "")
    return true
}
```

*Note:* To iOS 13 or the newest, you need import SDK in SceneDelegate.swift file

```swift
func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    VNPTSmartCATransaction.receiveBackLink(url: URLContexts.first!.url, sourceApp: "")
}
```

***Step 3: Update layout and pass required param to open VNPT SmartCA App***

*Note:*

- NotificationCenter registration VNPTSMARTCA NOTIFICATION KEYS should be removed when the ViewControllers relocating or dismissing completed
- Notification keys: `<VNPTSmartCA>NotificationCenterReceived`

## Author

VNPT SmartCA Development Team

## License

VNPT SmartCA iOS SDK is licensed under [The MIT license](https://github.com/VNPTSmartCA/ios-sdk-example/blob/master/LICENSE).
