import 'package:flutter/material.dart';

class AnimatedSizeExample extends StatefulWidget {
  const AnimatedSizeExample({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AnimatedSizeExampleState createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample>
    with TickerProviderStateMixin {
  double _height = 80.0;
  double _width = 80.0;
  var _color = Colors.blue;
  bool _resized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSize(
              curve: Curves.bounceInOut,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_resized) {
                      _resized = false;
                      _color = Colors.blue;
                      _height = 80.0;
                      _width = 80.0;
                    } else {
                      _resized = true;
                      _color = Colors.blue;
                      _height = 320.0;
                      _width = 320.0;
                    }
                  });
                },
                child: Container(
                  width: _width,
                  height: _height,
                  color: _color,
                ),
              ),
              vsync: this,
              duration: Duration(seconds: 1),
            ),
          ],
        ),
      ),
    );
  }
}
