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
3. Choose **Up to Next Minor Version** from `1.3.0`
4. Click **Add Package** and select the `BureauSMV` library

**Via `Package.swift`:**

Add the dependency to your package manifest:

```swift
dependencies: [
    .package(url: "https://github.com/Bureau-Inc/BureauSMV.git", .upToNextMinor(from: "1.3.0"))
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
pod 'BureauSMV', '~> 1.3.0'
```

2. Run the command below to install the SDK. If CocoaPods does not find version `1.3.0`, update your local specs repo first:

```bash
pod repo update
pod install
```

### Step 2: Initialize SDK

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

### Step 3: Usage
Make an authentication call using the `async/await` method:

```swift
let status = await authSDKObj.makeAuthCallAsync(mobile: "91<<mobile-number>>", correlationId: "<<correlationId>>")

switch status {
case .completed:
    // Request is serviceable
    break
default:
    // Handle other statuses (e.g. .networkAndOperatorMismatch, .timeout, .networkUnavailable)
    break
}
```

Alternatively, use the completion handler method:

```swift
authSDKObj.makeAuthCall(mobile: "91<<mobile-number>>", correlationId: "<<correlationId>>") { (status: AuthenticationStatus) in
    switch status {
    case .completed:
        // Request is serviceable
        break
    default:
        // Handle other statuses (e.g. .networkAndOperatorMismatch, .timeout, .networkUnavailable)
        break
    }
}
```

#### Objective-C

In Objective-C, the completion handler delivers an `AuthenticationResult`, which exposes `statusCode`, `message`, and `alertTitle`.

```objc
@import BureauSMV;

[authSDKObj makeAuthCallWithMobile:@"91<<mobile-number>>"
                    correlationId:@"<<correlationId>>"
                       completion:^(AuthenticationResult * _Nonnull result) {
    if (result.statusCode == AuthenticationStatusCodeCompleted) {
        // Request is serviceable
    } else {
        // Handle other statuses
    }
}];
```

### Step 4: PSP Callbacks (Optional)

Each authentication call accepts an optional `pspCallbacks` parameter — an array of `String` keys that tells the SDK which Payment Service Provider (PSP) callbacks to enable for that request. Pass the keys provided to you by Bureau for your integration. When omitted, it defaults to an empty array (`[]`) and no PSP callbacks are triggered.

**What to call:** the same `makeAuthCallAsync` / `makeAuthCall` methods from Step 3.

**What to pass:** an array of PSP callback key strings, e.g. `["<<psp-key-1>>", "<<psp-key-2>>"]`.

**Swift — `async/await`:**

```swift
let status = await authSDKObj.makeAuthCallAsync(
    mobile: "91<<mobile-number>>",
    correlationId: "<<correlationId>>",
    pspCallbacks: ["<<psp-key-1>>", "<<psp-key-2>>"]
)
```

**Swift — completion handler:**

```swift
authSDKObj.makeAuthCall(
    mobile: "91<<mobile-number>>",
    correlationId: "<<correlationId>>",
    pspCallbacks: ["<<psp-key-1>>", "<<psp-key-2>>"]
) { (status: AuthenticationStatus) in
    // Handle status
}
```

**Objective-C:**

```objc
[authSDKObj makeAuthCallWithMobile:@"91<<mobile-number>>"
                    correlationId:@"<<correlationId>>"
                     pspCallbacks:@[@"<<psp-key-1>>", @"<<psp-key-2>>"]
                       completion:^(AuthenticationResult * _Nonnull result) {
    // Handle result
}];
```
