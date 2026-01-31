import 'package:flutter/material.dart';
import 'package:xogame/players_name.dart';
import 'package:xogame/xo_screenn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hello",
      debugShowCheckedModeBanner: false,
      initialRoute: PlayersName.routName,
      routes: {
        Xoscreen.routName: (context) => Xoscreen(),
        PlayersName.routName: (context) => PlayersName(),
      },
    );
  }
}
