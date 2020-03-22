import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({Key key}) : super(key: key);

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  final _random = Random();
  double _height = 100;
  double _width = 100;
  double _borderRadius = 8;
  Color _color = Colors.blue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedContainer(
          margin: EdgeInsets.all(8),
          child: FlutterLogo(),
          width: this._width,
          height: this._height,
          decoration: BoxDecoration(
            color: this._color,
            borderRadius: BorderRadius.circular(this._borderRadius),
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.update),
          label: Text('Change random property'),
          onPressed: () => setState(
            () {
              _width = _random.nextInt(100).toDouble() + 50;
              _height = _random.nextInt(100).toDouble() + 50;
              _borderRadius = _random.nextInt(50).toDouble();
              _color = Color.fromRGBO(
                  _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);
            },
          ),
        ),
      ],
    );
  }
}
