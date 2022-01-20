package com.geeklone.fluttercord.fluttercord;

import android.content.Intent;
import android.content.res.Resources;

import android.media.projection.MediaProjection;
import android.media.projection.MediaProjectionManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private Intent serviceIntent;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), "fluttercord")
        .setMethodCallHandler((call, result) -> {
            if(call.method.equals("startService")){
                Log.d("RESULT", result.toString());
                startService();
            }
        });
    }

//    @Override
//    protected void onCreate(@Nullable Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//
//        /// Example: developers should call this method to set callback,
//        /// when dart call `createMediaProjection`, it would be return a MediaProjection through this callback
//        RequestMediaProjectionPermissionManager.getInstance().setRequestPermissionCallback(mediaProjectionCreatorCallback);
//
//        /// Customize the media projection foreground notification style (available since Android Q)
//        /// If not set, it will be the system default style
//        RequestMediaProjectionPermissionManager.getInstance().setForegroundServiceNotificationStyle(R.mipmap.ic_launcher, "Screen is being captured");
//    }
//
//    private final MediaProjectionCreatorCallback mediaProjectionCreatorCallback = new MediaProjectionCreatorCallback() {
//
//        @Override
//        public void onMediaProjectionCreated(MediaProjection projection, int errorCode) {
//            if (errorCode == RequestMediaProjectionPermissionManager.ERROR_CODE_SUCCEED) {
//                Log.i("MEDIA_PROJECTION_CREATOR", "Create media projection succeeded!");
//                mediaProjection = projection;
//            } else if (errorCode == RequestMediaProjectionPermissionManager.ERROR_CODE_FAILED_USER_CANCELED) {
//                Log.e("MEDIA_PROJECTION_CREATOR", "Create media projection failed because can not get permission");
//            } else if (errorCode == RequestMediaProjectionPermissionManager.ERROR_CODE_FAILED_SYSTEM_VERSION_TOO_LOW) {
//                Log.e("MEDIA_PROJECTION_CREATOR", "Create media projection failed because system api level is lower than 21");
//            }
//        }
//    };





    @Override
    protected void onDestroy() {
        super.onDestroy();
        stopService(serviceIntent);
    }

    private void startService(){
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
            startForegroundService(serviceIntent);
        } else {
            startService(serviceIntent);
        }
    }


//    private void startService(){
//        serviceIntent = new Intent(this, MyService.class);
//        startService(serviceIntent);
//    }
//
//    @Override
//    protected void onPause() {
//        Toast.makeText(MainActivity.this, "App Paused", Toast.LENGTH_LONG).show();
//        super.onPause();
//    }
//
//    @Override
//    protected void onResume() {
//        Toast.makeText(MainActivity.this, "Service Still Running", Toast.LENGTH_LONG).show();
//        super.onResume();
//    }
//
//    @Override
//    protected void onDestroy() {
//        stopService(serviceIntent);
//        super.onDestroy();
//    }
}

//        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
//            startForegroundService(new Intent(this, MyService.class));
//        }else{
//            startService(new Intent(this, MyService.class));
//        }