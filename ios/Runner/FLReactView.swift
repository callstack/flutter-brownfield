import Flutter
import React
import UIKit

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
        return FLReactView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }

    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLReactView: NSObject, FlutterPlatformView {
    private var _view: RCTRootView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")!
        _view = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "ReactNativeIntro",
            initialProperties: [:] as [NSObject : AnyObject],
            launchOptions: nil
        )
        super.init()
    }

    func view() -> UIView {
        return _view
    }
}
