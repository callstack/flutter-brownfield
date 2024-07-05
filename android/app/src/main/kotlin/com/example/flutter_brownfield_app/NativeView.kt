package com.example.flutter_brownfield_app

import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        val text = creationParams!!["text"] as String

        textView = TextView(context)
        textView.textSize = 72f
        textView.setBackgroundColor(Color.rgb(255, 0, 0))
        textView.text = "Native View: $text (id: $id)"
        textView.setOnClickListener {
            val intent = Intent(context, ReactActivity::class.java)
            context.startActivity(intent)
        }
    }
}