import 'package:flutter/material.dart';

class BasicAnimationExample extends StatefulWidget {
  const BasicAnimationExample({Key key}) : super(key: key);

  @override
  _BasicAnimationExampleState createState() => _BasicAnimationExampleState();
}

class _BasicAnimationExampleState extends State<BasicAnimationExample>
    with SingleTickerProviderStateMixin {
  Animation<double> _sizeAnimation;
  Animation<Color> _colorAnimation;
  AnimationController _controller;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    this._controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    this._curve =
        CurvedAnimation(parent: this._controller, curve: Curves.easeIn);
    this._sizeAnimation =
        Tween<double>(begin: 50, end: 100).animate(this._curve);
    this._colorAnimation =
        ColorTween(begin: Colors.transparent, end: Colors.red)
            .animate(this._curve);
    this._controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8.0),
          child: FlutterLogo(),
          color: this._colorAnimation.value,
          height: this._sizeAnimation.value,
          width: this._sizeAnimation.value,
        ),
        RaisedButton(
          child: Text('Forward'),
          onPressed:
              this._controller.isCompleted ? null : () => _controller.forward(),
        ),
        RaisedButton(
          child: Text('Reverse'),
          onPressed:
              this._controller.isDismissed ? null : () => _controller.reverse(),
        ),
        RaisedButton(
          child: Text('Loop'),
          onPressed: () {
            this._controller.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                this._controller.reverse();
              } else if (status == AnimationStatus.dismissed) {
                this._controller.forward();
              }
            });
            this._controller.forward();
          },
        ),
      ],
    );
  }
}
