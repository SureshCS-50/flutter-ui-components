import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/constants.dart';
import 'package:flutter_ui_components/modules/about/about.dart';
import 'package:flutter_ui_components/modules/app/app_settings.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:widget_with_codeview/widget_with_codeview.dart';

class UIRoute extends StatelessWidget {
  // Path of source file (relative to project root). The file's content will be
  // shown in the "Code" tab.
  final String sourceFilePath;
  // Actual content of the example.
  final Widget child;
  // Title shown in the route's appbar. By default just returns routeName.
  final String _title;
  // A short description of the route. If not null, will be shown as subtitle in
  // the home page list tile.
  final String description;
  // Reference Links.
  final Map<String, String> links;
  // Route name of a page.
  final String _routeName;

  const UIRoute({
    Key key,
    @required this.sourceFilePath,
    @required this.child,
    String title,
    this.description,
    this.links,
    String routeName,
  })  : _title = title,
        _routeName = routeName,
        super(key: key);

  String get routeName =>
      this._routeName ?? '/${this.child.runtimeType.toString()}';

  String get title => _title ?? this.routeName;

  @override
  Widget build(BuildContext context) {
    final double headerHeight = 128.0;
    final double appbarHeight = kToolbarHeight;
    final double backLayerHeight =
        MediaQuery.of(context).size.height - headerHeight - appbarHeight;
    return BackdropScaffold(
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(this.title),
      ),
      actions: _getAppbarActions(context),
      iconPosition: BackdropIconPosition.action,
      headerHeight: headerHeight,
      frontLayer: Builder(
        builder: (BuildContext context) =>
            routeName == Navigator.defaultRouteName
                ? this.child
                : WidgetWithCodeView(
                    child: this.child,
                    sourceFilePath: this.sourceFilePath,
                    codeLinkPrefix: '$GITHUB_URL/blob/master',
                  ),
      ),
      frontLayerBorderRadius: BorderRadius.only(),
      backLayer: Column(
        children: <Widget>[
          SizedBox(height: backLayerHeight, child: _getBackdropListTiles())
        ],
      ),
    );
  }

  List<Widget> _getAppbarActions(BuildContext context) {
    final settings = Provider.of<MyAppSettings>(context);
    return <Widget>[
      if (this.routeName != Navigator.defaultRouteName)
        settings.starStatusOfRoute(this.routeName),
      if (this.links?.isNotEmpty ?? false)
        PopupMenuButton(
          itemBuilder: (context) {
            return <PopupMenuItem>[
              for (MapEntry<String, String> titleAndLink in this.links.entries)
                PopupMenuItem(
                  child: ListTile(
                    title: Text(titleAndLink.key),
                    trailing: IconButton(
                      icon: Icon(Icons.open_in_new),
                      tooltip: '${titleAndLink.value}',
                      onPressed: () => url_launcher.launch(titleAndLink.value),
                    ),
                    onTap: () => url_launcher.launch(titleAndLink.value),
                  ),
                )
            ];
          },
        ),
    ];
  }

  ListView _getBackdropListTiles() {
    return ListView(
      padding: EdgeInsets.only(bottom: 32.0),
      children: <Widget>[
        ListTile(
          leading: APP_ICON,
          title: Text(APP_NAME),
          subtitle: Text(APP_VERSION),
        ),
        ...MyAboutRoute.aboutListTiles,
        Consumer<MyAppSettings>(builder: (context, MyAppSettings settings, _) {
          return ListTile(
            onTap: () {},
            leading: Icon(
                settings.isDarkMode ? Icons.brightness_4 : Icons.brightness_7),
            title: Text('Dark mode'),
            trailing: Switch(
              onChanged: (bool value) => settings.setDarkMode(value),
              value: settings.isDarkMode,
            ),
          );
        }),
      ],
    );
  }
}
