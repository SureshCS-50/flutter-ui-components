import 'package:flutter/material.dart';
import 'package:flutter_ui_components/routes/ui_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_routes.dart' show allRoutes;

class MyAppSettings extends ChangeNotifier {
  static const _bookmarkedRoutesPreferenceKey = 'BOOKMARKED_ROUTES';
  static const _darkModePreferenceKey = 'DARK_MODE';
  static final _routenameToRouteMap = {
    for (UIRoute route in allRoutes) route.routeName: route
  };

  final SharedPreferences _pref;

  MyAppSettings(this._pref);

  bool get isDarkMode => _pref?.getBool(_darkModePreferenceKey) ?? false;

  void setDarkMode(bool val) {
    _pref?.setBool(_darkModePreferenceKey, val);
    notifyListeners();
  }

  List<String> get starredRoutenames =>
      _pref?.getStringList(_bookmarkedRoutesPreferenceKey) ?? [];

  List<UIRoute> get starredRoutes => [
        for (String routename in this.starredRoutenames)
          if (_routenameToRouteMap[routename] != null)
            _routenameToRouteMap[routename]
      ];

  Widget starStatusOfRoute(String routeName) {
    return IconButton(
      tooltip: 'Bookmarks',
      icon: Icon(
        this.isStarred(routeName) ? Icons.star : Icons.star_border,
        color: this.isStarred(routeName) ? Colors.yellow : Colors.grey,
      ),
      onPressed: () => this.toggleStarred(routeName),
    );
  }

  bool isStarred(String routeName) =>
      starredRoutenames.contains(routeName) ?? false;

  void toggleStarred(String routeName) {
    final staredRoutes = this.starredRoutenames;
    if (isStarred(routeName)) {
      staredRoutes.remove(routeName);
    } else {
      staredRoutes.add(routeName);
    }
    final dedupedStaredRoutes = Set<String>.from(starredRoutenames).toList();
    _pref?.setStringList(_bookmarkedRoutesPreferenceKey, dedupedStaredRoutes);
    notifyListeners();
  }
}
