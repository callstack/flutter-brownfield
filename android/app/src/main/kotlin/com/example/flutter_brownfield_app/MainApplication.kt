package com.example.flutter_brownfield_app

import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactApplication
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.defaults.DefaultReactNativeHost
import com.facebook.soloader.SoLoader

class MainApplication: Application(), ReactApplication {

    private val reactNativeHost =
        object : DefaultReactNativeHost(this) {
            override fun getUseDeveloperSupport() = BuildConfig.DEBUG
            override fun getPackages(): List<ReactPackage> {
                val packages = PackageList(this).packages.toMutableList()
                // Packages that cannot be auto-linked yet can be added manually here
                return packages
            }
            override fun getJSMainModuleName(): String {
                return "index"
            }
        }

    override fun onCreate() {
        super.onCreate()
        SoLoader.init(this, false)
    }

    override fun getReactNativeHost(): ReactNativeHost = reactNativeHost
}