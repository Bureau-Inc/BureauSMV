# BureauSMV
Bureau Silent Mobile Verification SDK (OTL)

## Quick Start

### Step 1 - Add Dependency

1. SDK is available through [CocoaPods](https://cocoapods.org/pods/BureauSMV). To install it, simply add the following line to your Podfile:

```ruby
# Podfile
pod 'BureauSMV'
```

2. "import BureauSMV" in your UIViewcontroller

3: Configure info.plist
Open and add the below code to the info.plist file.

```<key>NSAppTransportSecurity</key>
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
    </dict>```
    
    
### Step 2: Initialize SDK
Create an instance of the Bureau SDK using the below builder pattern.

```  let authSDKObj = BureauAuth.Builder()
    .setClientId(clientId: "<client ID>")
    .setMode(mode: .production)
    .build()
```

### Step 3: Usage
Make an authentication call using the makeauthcall method.

```
let response: BureauAuthentication.AuthenticationStatus  = authSDKObj.makeAuthCall(mobile: "91<<mobile-number>>", correlationId: <<correlationId>>)
```
