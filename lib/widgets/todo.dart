import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final String title;
  final bool isDone;
  Todo({this.title, this.isDone = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            margin: EdgeInsets.only(
              right: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: isDone ? Color(0xFF7349FE) : Colors.grey[200],
            ),
            child: Image.asset(
              'assets/images/check_icon.png',
            ),
          ),
          Text(
            title == null ? "( Unnamed Task )" : title,
            style: TextStyle(
              color: isDone ? Color(0xFF211551) : Colors.black87,
              fontSize: 16,
              fontWeight: isDone ? FontWeight.bold : FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
