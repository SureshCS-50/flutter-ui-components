import 'package:flutter/material.dart';
import 'package:flutter_ui_components/modules/app/app_routes.dart';
import 'package:flutter_ui_components/modules/app/app_settings.dart';
import 'package:flutter_ui_components/routes/ui_route.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _bottmonNavBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.library_books),
      title: Text('Basics'),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.blueAccent,
      icon: Icon(Icons.insert_chart),
      title: Text('Advanced'),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.indigo,
      icon: Icon(Icons.people),
      title: Text('About'),
    ),
  ];

  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final basicDemos = <Widget>[
      for (final UIRouteGroup group in appRoutesBasic)
        _uiRouteGroupToExpansionTile(group),
    ];
    final advancedDemos = <Widget>[
      for (final UIRouteGroup group in appRoutesAdvanced)
        _uiRouteGroupToExpansionTile(group),
    ];
    final bookmarkAndAboutDemos = <Widget>[
      for (final UIRoute route
          in Provider.of<MyAppSettings>(context).starredRoutes)
        _uiRouteToListTile(route, leading: Icon(Icons.bookmark)),
      _uiRouteToListTile(aboutRoute, leading: Icon(Icons.info)),
    ];
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          ListView(children: basicDemos),
         ListView(children: advancedDemos),
          ListView(children: bookmarkAndAboutDemos),
        ],
        index: _currentTabIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottmonNavBarItems,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          setState(() => this._currentTabIndex = index);
        },
      ),
    );
  }

  ListTile _uiRouteToListTile(UIRoute uiRoute,
      {Widget leading, IconData trialing: Icons.keyboard_arrow_right}) {
    final routeTitleTextStyle =
        Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold);
    return ListTile(
      leading: leading ??
          Provider.of<MyAppSettings>(context)
              .starStatusOfRoute(uiRoute.routeName),
      title: Text(uiRoute.title, style: routeTitleTextStyle),
      trailing: trialing == null ? null : Icon(trialing),
      subtitle: uiRoute.description == null ? null : Text(uiRoute.description),
      onTap: () => Navigator.of(context).pushNamed(uiRoute.routeName),
    );
  }

  Widget _uiRouteGroupToExpansionTile(UIRouteGroup uiRouteGroup) {
    return Card(
      child: ExpansionTile(
        leading: uiRouteGroup.icon,
        title: Text(
          uiRouteGroup.groupName,
          style: Theme.of(context).textTheme.title,
        ),
        children: uiRouteGroup.routes.map(_uiRouteToListTile).toList(),
      ),
    );
  }
}
