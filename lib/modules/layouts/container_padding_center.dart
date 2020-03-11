import 'package:flutter/material.dart';

class ContainerExample extends StatelessWidget {
  const ContainerExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 5.0, color: Colors.black),
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20.0)),
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
            child: Text("hello"),
          ),
        ),
      ),
    );
  }
}
