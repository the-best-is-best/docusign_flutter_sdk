package com.example.docusign_flutter_sdk


import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import com.docusign.androidsdk.DSEnvironment
import com.docusign.androidsdk.DocuSign
import com.docusign.androidsdk.dsmodels.DSAppearance
import com.docusign.androidsdk.dsmodels.DSUser
import com.docusign.androidsdk.exceptions.DSAuthenticationException
import com.docusign.androidsdk.exceptions.DocuSignNotInitializedException
import com.docusign.androidsdk.listeners.DSAuthenticationListener
import com.docusign.androidsdk.util.DSMode
import com.example.docusign_flutter_sdk.constants.Constants
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DocusignFlutterSdkPlugin */
class DocusignFlutterSdkPlugin: FlutterPlugin, MethodCallHandler , ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private lateinit var activity: Activity

  //  companion object {
//    val TAG = DocusignFlutterSdkPlugin::class.java.simpleName
//  }
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "docusign_flutter_sdk")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext



  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result)
  {
    println("call is " + call.method)

    if (call.method=="logout_docu") {
      result.success(logoutDocu())
    }
    if(call.method=="init")
    {
      init(result, call)
    }
    if(call.method=="login")
    {
      result.success( login(result))
    }
    else{
      result.notImplemented()
    }

  }
  override fun onDetachedFromActivity() {
    TODO("Not yet implemented")
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    TODO("Not yet implemented")
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
    TODO("Not yet implemented")
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }


  private fun logoutDocu(): Boolean{

    DocuSign.getInstance().getAuthenticationDelegate().logout(activity, true, null)
    return true;
  }



  private fun init(@NonNull result: Result, @NonNull call: MethodCall){
    DocuSign.init(
      activity, Constants.integratorKey,
      Constants.clientSecretKey,
      Constants.redirectURI,
      DSMode.DEBUG
    ).setEnvironment(DSEnvironment.DEMO_ENVIRONMENT)

    val appearanceDelegate = DocuSign.getInstance().getAppearanceDelegate()
    val appearance = DSAppearance.Builder()

      .setBottomToolbarDocuSignImageVisibility(true)
      .build()
    appearanceDelegate.appearance = appearance
    result.success(true)
//    result.error( "invalidArgs", "Failed to Login to DocuSign",null)
//    return false;
  }
  private fun login(@NonNull result: Result) {

    try {
      val authDelegate = DocuSign.getInstance().getAuthenticationDelegate()

      // DS: Login authentication using OAuth
      authDelegate.login(
        Constants.LOGIN_REQUEST_CODE, activity,
        object : DSAuthenticationListener {
          override fun onSuccess(@NonNull user: DSUser) {

            Activity().finish()
            result.success(DocuSign.getInstance().getAuthenticationDelegate().getLoggedInUser(Activity()).userId)

          }

          override fun onError(@NonNull exception: DSAuthenticationException) {
            // Log.d(TAG, exception.message!!)
            Activity().finish()

            result.error("invalidArgs", "Failed to Login to DocuSign", null)

          }

        }


      )
      Activity().finish()
      result.success(DocuSign.getInstance().getAuthenticationDelegate().getLoggedInUser(Activity()).userId)



    } catch (exception: DocuSignNotInitializedException) {
      //Log.d(TAG, exception.message!!)
      result.error("invalidArgs", "Failed to Login to DocuSign", null)
      Activity().finish()
      // Toast.makeText(applicationContext, "Failed to Login to DocuSign", Toast.LENGTH_LONG).show()
      // return false
    }
  }

}
