package com.geeklone.fluttercord.fluttercord;

import android.content.Intent;
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

//    @Override
//    protected void onCreate(@Nullable Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), "fluttercord")
//        .setMethodCallHandler((call, result) -> {
//            if(call.method.equals("startService")){
//                Log.d("RESULT", result.toString());
//                startService();
//            }
//        });
//    }








    private void startService(){
        serviceIntent = new Intent(this, MyService.class);
        startService(serviceIntent);
    }

    @Override
    protected void onPause() {
        Toast.makeText(MainActivity.this, "App Paused", Toast.LENGTH_LONG).show();
        super.onPause();
    }

    @Override
    protected void onResume() {
        Toast.makeText(MainActivity.this, "Service Still Running", Toast.LENGTH_LONG).show();
        super.onResume();
    }

    @Override
    protected void onDestroy() {
        stopService(serviceIntent);
        super.onDestroy();
    }
}

//        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
//            startForegroundService(new Intent(this, MyService.class));
//        }else{
//            startService(new Intent(this, MyService.class));
//        }