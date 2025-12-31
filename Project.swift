import ProjectDescription

let project = Project(
    name: "WorkSurfaceApp",
    options: .options(
        developmentRegion: "ja",
        disableBundleAccessors: true,
        disableSynthesizedResourceAccessors: true
    ),
    settings: .settings(
        base: [
            "MARKETING_VERSION": "1.0",
            "CURRENT_PROJECT_VERSION": "1",
            "IPHONEOS_DEPLOYMENT_TARGET": "26.0",
            "MACOSX_DEPLOYMENT_TARGET": "26.0",
            "XROS_DEPLOYMENT_TARGET": "26.0",
            "SWIFT_VERSION": "6.0",
            "PRODUCT_BUNDLE_IDENTIFIER": "com.takashiki.workSurfaceApp",
            "SWIFT_STRICT_CONCURRENCY": "complete",
            "SWIFT_STRICT_MEMORY_SAFETY": "YES",
        ],
        configurations: [
            .debug(
                name: .debug,
                settings: [
                    "MTL_ENABLE_DEBUG_INFO": "YES",
                    "MTL_FAST_MATH": "NO",
                    "MTL_COMPILER_FLAGS": "-fmetal-enable-logging",
                    "MTL_LANGUAGE_REVISION": "Metal40",
                ]
            ),
            .release(
                name: .release,
                settings: [
                    "MTL_ENABLE_DEBUG_INFO": "NO",
                    "MTL_FAST_MATH": "YES",
                    "MTL_LANGUAGE_REVISION": "Metal40",
                ]
            ),
        ]
    ),
    targets: [
        // iOS専用フレームワーク
        .target(
            name: "WorkSurfaceiOSApp",
            destinations: [.iPhone, .iPad],
            product: .framework,
            bundleId: "com.takashiki.workSurfaceApp.iOSApp",
            deploymentTargets: .iOS("26.0"),
            sources: [
                .glob("Package/WorkSurfaceiOSApp/Sources/WorkSurfaceiOSApp/**/*.swift"),
            ],
            settings: .settings(
                base: [
                    "IPHONEOS_DEPLOYMENT_TARGET": "26.0",
                    "TARGETED_DEVICE_FAMILY": "1,2",
                ]
            )
        ),
        
        // iOS App Target
        .target(
            name: "WorkSurfaceApp_iOS",
            destinations: [.iPhone, .iPad],
            product: .app,
            bundleId: "com.takashiki.workSurfaceApp",
            deploymentTargets: .iOS("26.0"),
            infoPlist: .file(path: "WorkSurfaceApp/iOS/Info.plist"),
            sources: [
                .glob("WorkSurfaceApp/**/*.swift", excluding: ["WorkSurfaceApp/macOS/**", "WorkSurfaceApp/visionOS/**"]),
            ],
            resources: [
                .glob(pattern: "WorkSurfaceApp/Assets.xcassets/**"),
                .glob(pattern: "WorkSurfaceApp/iOS/InfoPlist.xcstrings"),
                .glob(pattern: "WorkSurfaceApp.icon/**"),
                .glob(pattern: "WorkSurfaceApp/iOS/LaunchScreen.storyboard"),
            ],
            dependencies: [
                .target(name: "WorkSurfaceiOSApp"),
            ],
            settings: .settings(
                base: [
                    "ASSETCATALOG_COMPILER_APPICON_NAME": "WorkSurfaceApp",
                    "ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME": "AccentColor",
                    "TARGETED_DEVICE_FAMILY": "1,2",
                    "IPHONEOS_DEPLOYMENT_TARGET": "26.0",
                    "SUPPORTS_XR_DESIGNED_FOR_IPHONE_IPAD": "NO",
                    "SUPPORTS_MAC_DESIGNED_FOR_IPHONE_IPAD": "NO",
                ]
            )
        ),
        
        // macOS App Target
        .target(
            name: "WorkSurfaceApp_macOS",
            destinations: .macOS,
            product: .app,
            bundleId: "com.takashiki.workSurfaceApp",
            deploymentTargets: .macOS("26.0"),
            infoPlist: .file(path: "WorkSurfaceApp/macOS/Info.plist"),
            sources: [
                .glob("WorkSurfaceApp/**/*.swift", excluding: ["WorkSurfaceApp/iOS/**", "WorkSurfaceApp/visionOS/**"]),
            ],
            resources: [
                .glob(pattern: "WorkSurfaceApp/Assets.xcassets/**"),
                .glob(pattern: "WorkSurfaceApp.icon/**"),
            ],
            settings: .settings(
                base: [
                    "ASSETCATALOG_COMPILER_APPICON_NAME": "WorkSurfaceApp",
                    "ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME": "AccentColor",
                    "MACOSX_DEPLOYMENT_TARGET": "26.0",
                ]
            )
        ),
        
        // visionOS App Target
        .target(
            name: "WorkSurfaceApp_visionOS",
            destinations: .visionOS,
            product: .app,
            bundleId: "com.takashiki.workSurfaceApp",
            deploymentTargets: .visionOS("26.0"),
            infoPlist: .file(path: "WorkSurfaceApp/visionOS/Info.plist"),
            sources: [
                .glob("WorkSurfaceApp/**/*.swift", excluding: ["WorkSurfaceApp/iOS/**", "WorkSurfaceApp/macOS/**"]),
            ],
            resources: [
                .glob(pattern: "WorkSurfaceApp/Assets.xcassets/**"),
                .glob(pattern: "WorkSurfaceApp.icon/**"),
            ],
            settings: .settings(
                base: [
                    "ASSETCATALOG_COMPILER_APPICON_NAME": "WorkSurfaceApp",
                    "ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME": "AccentColor",
                    "XROS_DEPLOYMENT_TARGET": "26.0",
                    "TARGETED_DEVICE_FAMILY": "7",
                ]
            )
        ),
    ],
    schemes: [
        .scheme(
            name: "WorkSurfaceApp_iOS",
            shared: true,
            buildAction: .buildAction(targets: ["WorkSurfaceApp_iOS"]),
            testAction: .targets(
                ["WorkSurfaceApp_iOS"],
                configuration: .debug,
                options: .options(coverage: true)
            ),
            runAction: .runAction(
                configuration: .debug,
                executable: "WorkSurfaceApp_iOS"
            ),
            archiveAction: .archiveAction(configuration: .release),
            profileAction: .profileAction(configuration: .release),
            analyzeAction: .analyzeAction(configuration: .debug)
        ),
        .scheme(
            name: "WorkSurfaceApp_macOS",
            shared: true,
            buildAction: .buildAction(targets: ["WorkSurfaceApp_macOS"]),
            testAction: .targets(
                ["WorkSurfaceApp_macOS"],
                configuration: .debug,
                options: .options(coverage: true)
            ),
            runAction: .runAction(
                configuration: .debug,
                executable: "WorkSurfaceApp_macOS"
            ),
            archiveAction: .archiveAction(configuration: .release),
            profileAction: .profileAction(configuration: .release),
            analyzeAction: .analyzeAction(configuration: .debug)
        ),
        .scheme(
            name: "WorkSurfaceApp_visionOS",
            shared: true,
            buildAction: .buildAction(targets: ["WorkSurfaceApp_visionOS"]),
            testAction: .targets(
                ["WorkSurfaceApp_visionOS"],
                configuration: .debug,
                options: .options(coverage: true)
            ),
            runAction: .runAction(
                configuration: .debug,
                executable: "WorkSurfaceApp_visionOS"
            ),
            archiveAction: .archiveAction(configuration: .release),
            profileAction: .profileAction(configuration: .release),
            analyzeAction: .analyzeAction(configuration: .debug)
        ),
    ]
)

