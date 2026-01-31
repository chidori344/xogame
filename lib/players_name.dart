import 'package:flutter/material.dart';
import 'package:xogame/xo_screenn.dart';

class PlayersName extends StatelessWidget {
  static const String routName = "player name screen";
  String player1Name = '';
  String player2Name = '';
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "welcome to saadany games",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(label: Text("player1 Name")),
              onChanged: (text) {
                player1Name = text;
              },
            ),

            TextField(
              decoration: InputDecoration(label: Text("player2 Name")),
              onChanged: (text) {
                player2Name = text;
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Xoscreen.routName,
                  arguments: XOGameBoardArgs(
                    player1Name: player1Name,
                    player2Name: player2Name,
                  ),
                );
              },
              child: Text(
                "go to xoGame",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
