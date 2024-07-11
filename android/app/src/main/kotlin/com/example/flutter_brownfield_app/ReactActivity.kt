package com.example.flutter_brownfield_app

import android.os.Bundle
import android.view.KeyEvent
import androidx.appcompat.app.AppCompatActivity
import com.facebook.react.ReactInstanceManager
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactRootView
import com.facebook.react.modules.core.DefaultHardwareBackBtnHandler

class ReactActivity : AppCompatActivity(), DefaultHardwareBackBtnHandler {
    // Easy access to ReactNativeHost
    private val reactNativeHost: ReactNativeHost
        get() = (application as MainApplication).reactNativeHost

    // Easy access to ReactNativeHost
    private val reactInstanceManager: ReactInstanceManager
        get() = (application as MainApplication).reactNativeHost.reactInstanceManager
    private var rootView: ReactRootView? = null


    override fun onCreate(savedInstanceState: Bundle?) {
        // Passing null recommended by React Navigation docs
        // See: https://reactnavigation.org/docs/getting-started/
        super.onCreate(null)

        val moduleName = intent.getStringExtra("moduleName")!!

        rootView = ReactRootView(this)
        rootView!!.startReactApplication(reactInstanceManager, moduleName, null)
        setContentView(rootView)
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

        rootView?.unmountReactApplication()
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
