import 'package:flutter/material.dart';

class AnimatedIconsExample extends StatefulWidget {
  const AnimatedIconsExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedIconsState createState() => _AnimatedIconsState();
}

class _AnimatedIconsState extends State<AnimatedIconsExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _status {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          getAnimatedIcon(AnimatedIcons.add_event, "Event to Add"),
          getAnimatedIcon(AnimatedIcons.arrow_menu, "Menu to Arrow"),
          getAnimatedIcon(AnimatedIcons.close_menu, "Menu to Close "),
          getAnimatedIcon(AnimatedIcons.home_menu, "Menu to Home"),
          getAnimatedIcon(AnimatedIcons.pause_play, "Play to Pause"),
        ],
      ),
    );
  }

  getAnimatedIcon(AnimatedIconData iconData, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                _controller.fling(velocity: _status ? -2.0 : 2.0);
              },
              icon: AnimatedIcon(
                icon: iconData,
                progress: _controller.view,
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
