import Flutter
import React
import UIKit

/**
 * Factory used by Flutter to create instances of FLReactView.
 * @see https://docs.flutter.dev/platform-integration/ios/platform-views
 */
class FLReactViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        let creationParams = args as? [String: Any]
        return FLReactView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: creationParams,
            binaryMessenger: messenger)
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
}

/**
 * Flutter platform view hosting React root view.
 *
 * It receives `moduleName` argument representing React component to load, it should match the
 * name of the component registered by `AppRegistry.registerComponent` in the React Native app.
 *
 * @see https://docs.flutter.dev/platform-integration/ios/platform-views
 */
class FLReactView: NSObject, FlutterPlatformView {
    private var reactRootView: RCTRootView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: [String: Any]?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")!
        reactRootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: args!["moduleName"] as! String,
            initialProperties: [:] as [NSObject : AnyObject],
            launchOptions: nil
        )
        super.init()
    }

    func view() -> UIView {
        return reactRootView
    }
}
