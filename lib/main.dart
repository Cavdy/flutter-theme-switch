import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Theme Switch",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum ThemeColor {
  red,
  blue
}

class _HomePageState extends State<HomePage> {

  bool _value = false;
  ThemeColor _themeColor = ThemeColor.red;

  void _onChangedValue(bool value) {
    setState(() {
      _value = value;
      if(_value){
        _themeColor = ThemeColor.blue;
      } else {
        _themeColor = ThemeColor.red;
      }
    });
  }

  void _switchThemeToBlue() {
    setState(() {
      _themeColor = ThemeColor.blue;
    });
  }

  void _switchThemeToRed() {
    setState(() {
      _themeColor = ThemeColor.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: _clickMe()
      ),
    );
  }

  List<Widget> _clickMe() {
    if(_themeColor == ThemeColor.red) {
      return [
        Container(
          decoration: BoxDecoration(color: Colors.red),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Theme Switch \n Welcome Cavdy",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Switch(
                    value: _value,
                    onChanged: (bool value) => _onChangedValue(value)
                ),
                RaisedButton(
                  child: Text("Switch", style: TextStyle(color: Colors.red)),
                  color: Colors.white,
                  onPressed: _switchThemeToBlue,
                )
              ],
            )
          ],
        )
      ];
    } else {
      return [
        Container(
          decoration: BoxDecoration(color: Colors.blue),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Theme Switch \n Welcome Cavdy",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Switch(
                    value: _value,
                    onChanged: (bool value) => _onChangedValue(value)
                ),
                RaisedButton(
                  child: Text("Switch", style: TextStyle(color: Colors.blue)),
                  color: Colors.white,
                  onPressed: _switchThemeToRed,
                )
              ],
            )
          ],
        )
      ];
    }
  }
}

