import 'package:flutter/material.dart';
import 'package:flutter_ui_components/modules/app/app_routes.dart';
import 'package:flutter_ui_components/modules/app/app_settings.dart';
import 'package:flutter_ui_components/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_ui_components/constants.dart' show APP_ICON;


class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (!snapshot.hasData) {
          return _MySplashScreen();
        }
        return ChangeNotifierProvider<MyAppSettings>.value(
          value: MyAppSettings(snapshot.data),
          child: _App(),
        );
      },
    );
  }
}

class _MySplashScreen extends StatelessWidget {
  const _MySplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Center(child: APP_ICON),
    );
  }
}

class _App extends StatelessWidget {
  const _App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Components',
      theme: Provider.of<MyAppSettings>(context).isDarkMode
          ? darkTheme
          : lightTheme,
      routes: router,
    );
  }
}
