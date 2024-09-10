package com.finservtech.timesmedlite

import android.content.Context
import android.opengl.GLSurfaceView
import android.view.View
import android.os.Handler
import android.os.Looper
import androidx.annotation.NonNull
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

var pubCam: View? = null
var subCam: View? = null

class MainActivity: FlutterActivity(){
    private val CHANNEL = "vonage";
    private var mContext: Context? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
    }

}
