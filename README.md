# BureauSMV
Bureau Silent Mobile Verification SDK (OTL)

## Quick Start

### Step 1 - Add Dependency

#### Option A: Swift Package Manager

**Via Xcode UI:**

1. In Xcode, go to **File > Add Package Dependencies...**
2. Enter the repository URL:
   ```
   https://github.com/Bureau-Inc/BureauSMV.git
   ```
3. Choose a version rule (e.g., **Up to Next Major Version** from `1.0.4`)
4. Click **Add Package** and select the `BureauSMV` library

**Via `Package.swift`:**

Add the dependency to your package manifest:

```swift
dependencies: [
    .package(url: "https://github.com/Bureau-Inc/BureauSMV.git", from: "1.0.4")
]
```

Then add `BureauSMV` to your target's dependencies:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "BureauSMV", package: "BureauSMV")
        ]
    )
]
```

#### Option B: CocoaPods

1. SDK is available through [CocoaPods](https://cocoapods.org/pods/BureauSMV). To install it, simply add the following line to your Podfile:

```ruby
# Podfile
pod 'BureauSMV'
```

### Step 2 - Configure info.plist
Open and add the below code to the info.plist file.

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    <key>NSExceptionDomains</key>
    <dict>
        <key>mcext.zumigo.com</key>
        <dict>
            <key>NSExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSIncludesSubdomains</key>
            <true/>
        </dict>
        <key>passport.airtel.in</key>
        <dict>
            <key>NSExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSIncludesSubdomains</key>
            <true/>
        </dict>
        <key>partnerapi.jio.com</key>
        <dict>
            <key>NSExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSIncludesSubdomains</key>
            <true/>
        </dict>
    </dict>
</dict>
```

### Step 3: Initialize SDK

1. Import the SDK in your UIViewController:

```swift
import BureauSMV
```

2. Create an instance of the Bureau SDK using the below builder pattern:

```swift
let authSDKObj = BureauAuth.Builder()
    .setClientId(clientId: "<<client ID>>")
    .setMode(mode: .production)
    .build()
```

### Step 4: Usage
Make an authentication call using the makeauthcall method.

```swift
let response: AuthenticationStatus = authSDKObj.makeAuthCall(mobile: "91<<mobile-number>>", correlationId: <<correlationId>>)
```
