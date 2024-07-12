package com.example.flutter_brownfield_app

import android.content.Intent
import android.view.KeyEvent
import com.facebook.react.ReactInstanceManager
import com.facebook.react.ReactNativeHost
import com.facebook.react.modules.core.DefaultHardwareBackBtnHandler
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * Basic FlutterActivity extended with React Native lifecycle hooks/
 *
 * See:
 * - https://reactnative.dev/docs/integration-with-existing-apps
 * - https://reactnative.dev/docs/integration-with-android-fragment
 */
class MainActivity: FlutterActivity(), DefaultHardwareBackBtnHandler {
    companion object {
        // Communication channel with Flutter. Used to receive native code calls.
        private const val FLUTTER_CHANNEL = "flutter-brownfield/native"
    }

    // Easy access to ReactNativeHost
    private val reactNativeHost: ReactNativeHost
        get() = (application as MainApplication).reactNativeHost
    // Easy access to ReactNativeHost
    private val reactInstanceManager: ReactInstanceManager
        get() = (application as MainApplication).reactNativeHost.reactInstanceManager

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Register ReactViewFactory with Flutter engine
        // See: https://docs.flutter.dev/platform-integration/android/platform-views#on-the-platform-side
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("react_view", ReactViewFactory())

        // Register MethodChannel, so we can call it from Flutter code.
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, FLUTTER_CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "navigateToReactNative") {
                val moduleName = call.argument<String>("moduleName")!!
                startReactNativeActivity(moduleName)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    fun startReactNativeActivity(moduleName: String) {
        val intent = Intent(this, ReactActivity::class.java).apply {
            putExtra("moduleName", moduleName)
        }
        startActivity(intent)
    }

    // Inform React Native Host about "onPause" lifecycle event
    override fun onPause() {
        super.onPause()
        reactInstanceManager.onHostPause(this)
    }

    // Inform React Native Host about "onResume" lifecycle event
    override fun onResume() {
        super.onResume()
        reactInstanceManager.onHostResume(this, this)
    }

    // Inform React Native Host about "onDestroy" lifecycle event
    override fun onDestroy() {
        super.onDestroy()
        reactInstanceManager.onHostDestroy(this)
    }

    // Inform React Native Host about "onBackPressed" lifecycle event
    override fun onBackPressed() {
        reactInstanceManager.onBackPressed()
        super.onBackPressed()
    }

    // Trigger Dev Options dialog when user presses "menu" button on Simulator.
    override fun onKeyUp(keyCode: Int, event: KeyEvent): Boolean {
        if (keyCode == KeyEvent.KEYCODE_MENU && reactNativeHost.hasInstance()) {
            reactInstanceManager.showDevOptionsDialog()
            return true
        }
        return super.onKeyUp(keyCode, event)
    }

    // Required by DefaultHardwareBackBtnHandler
    override fun invokeDefaultOnBackPressed() {
        super.onBackPressed()
    }
}
