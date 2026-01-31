import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String? text = '';
  int index = 0;
  Function onButtonclick;

  BoardButton({
    required this.text,
    required this.index,
    required this.onButtonclick,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsetsDirectional.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            onButtonclick(index);
          },
          child: Text(
            '$text',
            style: TextStyle(fontSize: 48, color: Colors.white),
          ),
        ),
      ),
    );
    ;
  }
}
