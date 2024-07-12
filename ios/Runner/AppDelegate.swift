import Flutter
import React
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
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
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")!
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: moduleName,
            initialProperties: [:] as [NSObject : AnyObject],
            launchOptions: nil
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
