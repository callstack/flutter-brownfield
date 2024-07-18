import Flutter
import React
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Register MethodChannel, so we can call it from Flutter code from native.
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(
            name: "flutter-brownfield/native",
            binaryMessenger: controller.binaryMessenger
        )
        
        channel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard let self = self else { 
                return
            }
            
            switch call.method {
            // Trigger navigation to separate React Native ViewController for usage with React Navigation
            case "navigateToReactNative":
                let args = call.arguments as! [String: Any];
                let moduleName = args["moduleName"] as! String;
                presentReactNativeViewController(moduleName: moduleName)
            default:
                result(
                    FlutterMethodNotImplemented
                )
            }
        })
        
        GeneratedPluginRegistrant.register(with: self)
        
        // Register FLReactViewFactory with Flutter engine.
        // See: https://docs.flutter.dev/platform-integration/ios/platform-views
        guard let pluginRegistrar = self.registrar(forPlugin: "plugin-name") else {
            return false
        }
        pluginRegistrar.register(
            FLReactViewFactory(messenger: pluginRegistrar.messenger()),
            withId: "react_view"
        )
        
        // Load React Native to BridgeManager holder.
        BridgeManager.shared.loadReactNative(launchOptions: launchOptions)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    /**
     * Present React Native components inside a separate ViewController. This is useful if you want to use React Navigation to manage the screen transitions.
     *
     * Use FLReactView if you want to use React Native views side-by-side with Flutter views on the same screen.
     */
    func presentReactNativeViewController(
        moduleName: String
    ) {
        guard let bridge = BridgeManager.shared.bridge else {
            fatalError("BridgeManager.shared.bridge is nil. Make sure to call BridgeManager.shared.loadReactNative() before calling presentReactNativeViewController.")
        }
        
        let rootView = RCTRootView(
            bridge: bridge,
            moduleName: moduleName,
            initialProperties: [:]
        )
        
        let viewController = UIViewController()
        viewController.view = rootView
        viewController.modalPresentationStyle = .fullScreen
        window?.rootViewController?.present(
            viewController,
            animated: true,
            completion: nil
        )
    }
}
