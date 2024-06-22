package com.example.form_tts

import android.os.Bundle
import android.speech.tts.TextToSpeech
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import java.util.Locale

class MainActivity : FlutterActivity(), TextToSpeech.OnInitListener {
    private lateinit var tts: TextToSpeech
    private val CHANNEL = "com.example.my_app2/userInput"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        tts = TextToSpeech(this, this)

        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "createVoiceUtterance") {
                val name = call.argument<String>("name") ?: ""
                val addressLine1 = call.argument<String>("addressLine1") ?: ""
                val city = call.argument<String>("city") ?: ""
                val state = call.argument<String>("state") ?: ""
                val country = call.argument<String>("country") ?: ""
                val text = "Name: $name, Address: $addressLine1, City: $city, State: $state, Country: $country"
                speakText(text)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onInit(status: Int) {
        if (status == TextToSpeech.SUCCESS) {
            tts.language = Locale.US
        } else {
            // Initialization failed
        }
    }

    private fun speakText(text: String) {
        tts.speak(text, TextToSpeech.QUEUE_FLUSH, null, null)
    }

    override fun onDestroy() {
        if (this::tts.isInitialized) {
            tts.stop()
            tts.shutdown()
        }
        super.onDestroy()
    }
}
