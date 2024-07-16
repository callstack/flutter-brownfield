import Foundation
import React
  
// Source: https://github.com/TMisiukiewicz/react-native-host-example/blob/main/ios/ReactNativeHostExample/ReactNativeViewController.swift
class BridgeManager: NSObject {
    static let shared = BridgeManager()
  
    var bridge: RCTBridge?
  
    public func loadReactNative(launchOptions: [AnyHashable: Any]?) {
        bridge = RCTBridge(delegate: self, launchOptions: launchOptions)
    }
}
  
extension BridgeManager: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge) -> URL? {
        #if DEBUG
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")
        #else
        return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
        #endif
    }
}
