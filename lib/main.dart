import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'dart:async';

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FridgeHero',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: FridgeHeroHome(title: 'FridgeHero'),
    );
  }
}

class FridgeHeroHome extends StatefulWidget {
  FridgeHeroHome({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FridgeHeroHomeState createState() => _FridgeHeroHomeState();
}

class _FridgeHeroHomeState extends State<FridgeHeroHome> {
  String _buttonText = 'Placeholder';

//  _FridgeHeroHomeState() {
//    makeRequest().then((val) => setState(() {
//      _buttonText = val;
//    }));
//  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(child: Text(_buttonText), onPressed: () {
              makeRequest();
            },
            ),
          ],
        ),
      ),
    );
  }

  makeRequest() async {
    var url = "https://jsonplaceholder.typicode.com/todos/1";

    await http.post(url, body: {})
        .then((response) {

      setState(() {
        _buttonText = response.body.toString();
      });
    });
  }
}
