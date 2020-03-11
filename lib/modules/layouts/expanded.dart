import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: Text('Item1: flex=1'),
            color: Colors.red,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Text('Item2: flex=2'),
            color: Colors.green,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          flex: 3,
          child: Container(
            child: Text('Item3, flex=3'),
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
