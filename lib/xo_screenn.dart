import 'package:flutter/material.dart';
import 'package:xogame/board_button.dart';

class Xoscreen extends StatefulWidget {
  static const String routName = "xo screen";

  @override
  State<Xoscreen> createState() => _XoscreenState();
}

class _XoscreenState extends State<Xoscreen> {
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as XOGameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text("xo screen"),
        titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.player1Name} (x)",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text("$player1Score", style: TextStyle(fontSize: 24)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.player2Name} (o)",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text("$player2Score", style: TextStyle(fontSize: 24)),
                  ],
                ),
              ],
            ),
          ), //players Row
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  text: boardState[0],
                  index: 0,
                  onButtonclick: onButtonclick,
                ),
                BoardButton(
                  text: boardState[1],
                  index: 1,
                  onButtonclick: onButtonclick,
                ),
                BoardButton(
                  text: boardState[2],
                  index: 2,
                  onButtonclick: onButtonclick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  text: boardState[3],
                  index: 3,
                  onButtonclick: onButtonclick,
                ),
                BoardButton(
                  text: boardState[4],
                  index: 4,
                  onButtonclick: onButtonclick,
                ),
                BoardButton(
                  text: boardState[5],
                  index: 5,
                  onButtonclick: onButtonclick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  text: boardState[6],
                  index: 6,
                  onButtonclick: onButtonclick,
                ),
                BoardButton(
                  text: boardState[7],
                  index: 7,
                  onButtonclick: onButtonclick,
                ),
                BoardButton(
                  text: boardState[8],
                  index: 8,
                  onButtonclick: onButtonclick,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonclick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardState[index] = "x";
    } else {
      boardState[index] = "o";
    }
    counter++;
    if (CheckWinner("x")) {
      player1Score += 5;
      initboard();
    } else if (CheckWinner("o")) {
      player2Score += 5;
      initboard();
    } else if (counter == 9) {
      initboard();
    }
    setState(() {});
  }

  bool CheckWinner(String sympol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == sympol &&
          boardState[i + 1] == sympol &&
          boardState[i + 2] == sympol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == sympol &&
          boardState[i + 3] == sympol &&
          boardState[i + 6] == sympol) {
        return true;
      }
    }
    if (boardState[0] == sympol &&
        boardState[4] == sympol &&
        boardState[8] == sympol) {
      return true;
    }
    if (boardState[2] == sympol &&
        boardState[4] == sympol &&
        boardState[6] == sympol) {
      return true;
    }
    return false;
  }

  void initboard() {
    boardState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
  }
}

/// class data
class XOGameBoardArgs {
  String player1Name;
  String player2Name;

  XOGameBoardArgs({required this.player1Name, required this.player2Name});
}
