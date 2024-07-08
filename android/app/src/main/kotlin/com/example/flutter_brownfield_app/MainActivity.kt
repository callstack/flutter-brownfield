package com.example.flutter_brownfield_app

import android.os.Bundle
import android.view.KeyEvent
import com.facebook.react.PackageList
import com.facebook.react.ReactInstanceManager
import com.facebook.react.ReactNativeHost
import com.facebook.react.common.LifecycleState
import com.facebook.react.modules.core.DefaultHardwareBackBtnHandler
import com.facebook.soloader.SoLoader
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity(), DefaultHardwareBackBtnHandler {
    private val reactNativeHost: ReactNativeHost
        get() = (application as MainApplication).reactNativeHost
    private val reactInstanceManager: ReactInstanceManager
        get() = (application as MainApplication).reactNativeHost.reactInstanceManager

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("native_view", NativeViewFactory())
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("react_view", ReactViewFactory())
    }

    override fun onPause() {
        super.onPause()
        reactInstanceManager.onHostPause(this)
    }

    override fun onResume() {
        super.onResume()
        reactInstanceManager.onHostResume(this, this)
    }

    override fun onDestroy() {
        super.onDestroy()
        reactInstanceManager.onHostDestroy(this)
    }

    override fun onBackPressed() {
        reactInstanceManager.onBackPressed()
        super.onBackPressed()
    }

    override fun onKeyUp(keyCode: Int, event: KeyEvent): Boolean {
        if (keyCode == KeyEvent.KEYCODE_MENU && reactNativeHost.hasInstance()) {
            reactInstanceManager.showDevOptionsDialog()
            return true
        }
        return super.onKeyUp(keyCode, event)
    }

    override fun invokeDefaultOnBackPressed() {
        super.onBackPressed()
    }
}
