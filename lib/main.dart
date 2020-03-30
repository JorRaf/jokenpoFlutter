import 'package:flutter/material.dart';
import 'package:jokenpo/Jogo.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  static const String _title = 'Joken Po';

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: Jogo(),
      debugShowCheckedModeBanner: false,
    );
  }
}