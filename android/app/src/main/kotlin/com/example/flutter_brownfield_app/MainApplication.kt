package com.example.flutter_brownfield_app

import android.app.Application
import com.facebook.react.ReactInstanceManager

class MainApplication: Application() {
    var reactInstanceManager: ReactInstanceManager? = null
}