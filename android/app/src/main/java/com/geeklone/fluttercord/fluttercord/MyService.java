package com.geeklone.fluttercord.fluttercord;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.widget.Toast;

public class MyService extends Service {
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return super.onStartCommand(intent, flags, startId);
    }

    @Override
    public void onStart(Intent intent, int startId) {
//        Toast.makeText(MyService.this, "Service Started", Toast.LENGTH_LONG).show();
        super.onStart(intent, startId);
    }

    public MyService() {

    }

    @Override
    public void onCreate() {
        Toast.makeText(MyService.this, "ON CREATE CALLED", Toast.LENGTH_LONG).show();
        super.onCreate();
    }

    @Override
    public void onDestroy() {
        Toast.makeText(MyService.this, "Service Destroyed", Toast.LENGTH_LONG).show();
        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent intent) {
        // TODO: Return the communication channel to the service.
        throw new UnsupportedOperationException("Not yet implemented");
    }
}