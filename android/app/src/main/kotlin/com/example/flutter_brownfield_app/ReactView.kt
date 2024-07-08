package com.example.flutter_brownfield_app

import android.content.Context
import android.view.View
import com.facebook.react.ReactRootView
import io.flutter.plugin.platform.PlatformView

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