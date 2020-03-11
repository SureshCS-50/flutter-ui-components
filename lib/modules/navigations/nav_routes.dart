import 'package:flutter/material.dart';

// Ref: https://github.com/tensor-programming/dart_flutter_multi_page_app.

class RoutesExample extends StatelessWidget {

  const RoutesExample({Key key}) : super(key: key);

  static const routeName = '/RoutesExample';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Page 1'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to page 2'),
          onPressed: () {
            Navigator.push(context, _PageTwo());
          },
        ),
      ),
    );
  }
}

class _PageTwo extends MaterialPageRoute<Null> {
  _PageTwo()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Page 2'),
              elevation: 1.0,
            ),

            // Ref: https://stackoverflow.com/a/51304732.

            body: Builder(
              builder: (BuildContext context) => Center(
                child: RaisedButton(
                  child: Text('Go to page 3'),
                  onPressed: () {
                    // Navigator.push<T> returns a Future<T>, which is the
                    // return value of the pushed route when it's popped.
                    Navigator.push<String>(context, _PageThree())
                      ..then((returnVal) {
                        if (returnVal != null) {
                          Scaffold.of(context).removeCurrentSnackBar();
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('You clicked: $returnVal'),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {},
                              ),
                            ),
                          );
                        }
                      });
                  },
                ),
              ),
            ),
          );
        });
}

class _PageThree extends MaterialPageRoute<String> {
  _PageThree()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Last page'),
              elevation: 2.0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(32.0),
              child: ListView(
                children: <Widget>[
                  MaterialButton(
                    child: Text('Go to page 1'),
                    onPressed: () {
                      // Pops until reaching a route with that route name.
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName(RoutesExample.routeName),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
}
