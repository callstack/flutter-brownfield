package com.example.flutter_brownfield_app

import android.os.Bundle
import android.view.KeyEvent
import com.facebook.react.PackageList
import com.facebook.react.ReactInstanceManager
import com.facebook.react.common.LifecycleState
import com.facebook.react.modules.core.DefaultHardwareBackBtnHandler
import com.facebook.soloader.SoLoader
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity(), DefaultHardwareBackBtnHandler {
    private val mainApplication: MainApplication
        get() = application as MainApplication
    private val reactInstanceManager: ReactInstanceManager?
        get() = mainApplication.reactInstanceManager

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

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        SoLoader.init(this, false)

        val packages = PackageList(application).packages
        mainApplication.reactInstanceManager = ReactInstanceManager.builder()
            .setApplication(mainApplication)
            .setCurrentActivity(this)
            .setBundleAssetName("index.android.bundle")
            .setJSMainModulePath("index")
            .addPackages(packages)
            .setUseDeveloperSupport(BuildConfig.DEBUG)
            .setInitialLifecycleState(LifecycleState.RESUMED)
            .build()
    }

    override fun onPause() {
        super.onPause()
        reactInstanceManager?.onHostPause(this)
    }

    override fun onResume() {
        super.onResume()
        reactInstanceManager?.onHostResume(this, this)
    }

    override fun onDestroy() {
        super.onDestroy()
        reactInstanceManager?.onHostDestroy(this)
    }

    override fun onBackPressed() {
        if (reactInstanceManager != null) {
            reactInstanceManager!!.onBackPressed()
        } else {
            super.onBackPressed()
        }
    }

    override fun onKeyUp(keyCode: Int, event: KeyEvent): Boolean {
        if (keyCode == KeyEvent.KEYCODE_MENU && reactInstanceManager != null) {
            reactInstanceManager!!.showDevOptionsDialog()
            return true
        }
        return super.onKeyUp(keyCode, event)
    }

    override fun invokeDefaultOnBackPressed() {
        super.onBackPressed()
    }
}
