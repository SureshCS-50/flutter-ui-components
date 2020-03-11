package com.sureshcs50.flutter_ui_components;

import android.content.Context;

import io.flutter.app.FlutterApplication;
import androidx.multidex.MultiDex;


public class FlutterUiComponentsApplication extends FlutterApplication {
  @Override
  protected void attachBaseContext(Context base) {
     super.attachBaseContext(base);
     MultiDex.install(this);
  }
}