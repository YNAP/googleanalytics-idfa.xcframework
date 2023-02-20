# GoogleAnalytics-IDFA xcframework

This is an `xcframework` wrapper (SPM ready) around `GoogleAnalytics.framework` and `libAdIdAccessLibrary.a`.

The package contains both `GoogleAnalytics.xcframework` and `libAdIdAccessLibrary.xcframework` (if you would like your application to access the identifier for advertisers (IDFA), the `libAdIdAccessLibrary` contains functions that call the `AdSupport` framework).

### How To for nerds

1) Download `GoogleAnalytics` from [here](https://github.com/CocoaPods/Specs/blob/master/Specs/4/9/c/GoogleAnalytics/3.21.0/GoogleAnalytics.podspec.json) and `libAdIdAccessLibrary` from [here](https://github.com/CocoaPods/Specs/blob/master/Specs/1/c/4/GoogleIDFASupport/3.14.0/GoogleIDFASupport.podspec.json).
2) Unzip the packages: `GoogleAnalytics` is already a `.xcframework`, instead `libAdIdAccessLibrary` is a (fat) static library (`.a`) and it needs to be converted in `.xcframework` as well.
3) Strip architectures from the fat framework:

###### iPhone Simulator
```
$ lipo libAdIdAccessLibrary.a -remove arm64 -remove armv7 -output iphonesimulator/libAdIdAccessLibrary.a
```

###### iPhone OS
```
$ lipo libAdIdAccessLibrary.a -remove i386 -remove x86_64 -output iphoneos/libAdIdAccessLibrary.a
```
Tip, check the correct archs using: 
```
$ lipo -info iphonesimulator/libAdIdAccessLibrary.a
Architectures in the fat file: libAdIdAccessLibrary.a are: i386 x86_64
```

4) Build the `.xcframework`:
```
$ xcodebuild -create-xcframework \
-library iphoneos/libAdIdAccessLibrary.a \
-library iphonesimulator/libAdIdAccessLibrary.a \
-output libAdIdAccessLibrary.xcframework
```

5) Here we go.. `libAdIdAccessLibrary.xcframework` has been created and it's ready to be used in the project/package (alongside `GoogleAnalytics.xcframework`)!

### Specs

```
GoogleAnalytics.xcframework
├── Info.plist
├── ios-arm64_armv7
│   └── GoogleAnalytics.framework
│       ├── GoogleAnalytics
│       ├── Headers
│       │   ├── GAI.h
│       │   ├── GAIDictionaryBuilder.h
│       │   ├── GAIEcommerceFields.h
│       │   ├── GAIEcommerceProduct.h
│       │   ├── GAIEcommerceProductAction.h
│       │   ├── GAIEcommercePromotion.h
│       │   ├── GAIFields.h
│       │   ├── GAILogger.h
│       │   ├── GAITrackedViewController.h
│       │   ├── GAITracker.h
│       │   └── GoogleAnalytics-umbrella.h
│       ├── Info.plist
│       └── Modules
│           └── module.modulemap
├── ios-arm64_i386_x86_64-simulator
│   └── GoogleAnalytics.framework
│       ├── GoogleAnalytics
│       ├── Headers
│       │   ├── GAI.h
│       │   ├── GAIDictionaryBuilder.h
│       │   ├── GAIEcommerceFields.h
│       │   ├── GAIEcommerceProduct.h
│       │   ├── GAIEcommerceProductAction.h
│       │   ├── GAIEcommercePromotion.h
│       │   ├── GAIFields.h
│       │   ├── GAILogger.h
│       │   ├── GAITrackedViewController.h
│       │   ├── GAITracker.h
│       │   └── GoogleAnalytics-umbrella.h
│       ├── Info.plist
│       └── Modules
│           └── module.modulemap
└── ios-arm64_x86_64-maccatalyst
    └── GoogleAnalytics.framework
        ├── GoogleAnalytics
        ├── Headers
        │   ├── GAI.h
        │   ├── GAIDictionaryBuilder.h
        │   ├── GAIEcommerceFields.h
        │   ├── GAIEcommerceProduct.h
        │   ├── GAIEcommerceProductAction.h
        │   ├── GAIEcommercePromotion.h
        │   ├── GAIFields.h
        │   ├── GAILogger.h
        │   ├── GAITrackedViewController.h
        │   ├── GAITracker.h
        │   └── GoogleAnalytics-umbrella.h
        ├── Info.plist
        └── Modules
            └── module.modulemap

13 directories, 43 files
```

```
libAdIdAccessLibrary.xcframework
├── Info.plist
├── ios-arm64_armv7
│   └── libAdIdAccessLibrary.a
└── ios-i386_x86_64-simulator
    └── libAdIdAccessLibrary.a

3 directories, 3 files
```

#### Versions
`GoogleAnalytics` - [3.21.0](https://github.com/CocoaPods/Specs/blob/master/Specs/4/9/c/GoogleAnalytics/3.21.0/GoogleAnalytics.podspec.json) (latest available via CocoaPods)

`libAdIdAccessLibrary` - [3.14.0](https://github.com/CocoaPods/Specs/blob/master/Specs/1/c/4/GoogleIDFASupport/3.14.0/GoogleIDFASupport.podspec.json) (latest available via CocoaPods)
