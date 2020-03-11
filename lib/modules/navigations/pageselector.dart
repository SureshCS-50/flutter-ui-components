import 'package:flutter/material.dart';

class PageSelectorExample extends StatelessWidget {
  const PageSelectorExample({Key key}) : super(key: key);

  static const icons = <Icon>[
    Icon(Icons.event),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.alarm),
    Icon(Icons.face),
    Icon(Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: icons.length,
      // Use a Builder here, otherwise `DefaultTabController.of(context)` below
      // returns null.
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TabPageSelector(),
              Expanded(
                child: IconTheme(
                  data: IconThemeData(
                    size: 128.0,
                    color: Theme.of(context).accentColor,
                  ),
                  child: TabBarView(children: icons),
                ),
              ),
              RaisedButton(
                child: Text('SKIP'),
                onPressed: () {
                  final TabController controller =
                      DefaultTabController.of(context);
                  if (!controller.indexIsChanging) {
                    controller.animateTo(icons.length - 1);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
