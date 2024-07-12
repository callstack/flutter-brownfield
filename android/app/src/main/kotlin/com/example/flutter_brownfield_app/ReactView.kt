package com.example.flutter_brownfield_app

import android.content.Context
import android.view.View
import com.facebook.react.ReactRootView
import io.flutter.plugin.platform.PlatformView

/**
 * This view is used to embed React Native view directly in the native view hierarchy. It allows to
 * mix and match Flutter and React Native views on one screen.
 */
internal class ReactView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val reactNativeHost = (context.applicationContext as MainApplication).reactNativeHost
    private val reactRootView: ReactRootView = ReactRootView(context)

    override fun getView(): View {
        return reactRootView
    }

    override fun dispose() {
        reactRootView.unmountReactApplication()
    }

    init {
        val moduleName = creationParams?.get("moduleName") as String
        reactRootView.startReactApplication(reactNativeHost.reactInstanceManager, moduleName, null)
    }
}