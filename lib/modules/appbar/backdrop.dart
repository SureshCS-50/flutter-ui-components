import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

class BackdropExample extends StatelessWidget {
  const BackdropExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      title: Text('Backdrop demo'),
      iconPosition: BackdropIconPosition.action,
      headerHeight: 120.0,
      frontLayer: Center(
          child: Text(
              'Click top-right button to show back layer.')),
      backLayer: Center(child: Text('(back layer)')),
    );
  }
}
