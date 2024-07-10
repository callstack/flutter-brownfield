import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Register FLReactViewFactory with Flutter engine.
    // See: https://docs.flutter.dev/platform-integration/ios/platform-views
    guard let pluginRegistrar = self.registrar(forPlugin: "plugin-name") else { return false }
    pluginRegistrar.register(
      FLReactViewFactory(messenger: pluginRegistrar.messenger()),
      withId: "react_view"
    )
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
