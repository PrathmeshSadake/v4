import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final String title;
  final bool isDone;
  Todo({this.title, this.isDone = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12,
      ),
      child: Row(
        children: [
          Container(
              height: 25,
              width: 25,
              margin: EdgeInsets.only(
                right: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: isDone ? Color(0xFF7349FE) : Colors.grey[200],
                border: Border.all(
                  color: Colors.grey[800],
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.check,
                color: Colors.black,
                size: 18,
              )),
          Flexible(
            child: Text(
              title == null ? "( Unnamed Task )" : title,
              style: TextStyle(
                color: isDone ? Color(0xFF211551) : Colors.black87,
                fontSize: 18,
                fontWeight: isDone ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
