import 'package:Todoist/widgets/todo.dart';
import 'package:flutter/material.dart';

class Taskpage extends StatefulWidget {
  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 8,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child:
                              Image.asset('assets/images/back_arrow_icon.png'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Task Title',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Color(0xff211551),
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Task Description',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Color(0xff211551),
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                ),
                Todo(
                  title: 'Going to Sleep',
                  isDone: false,
                ),
                Todo(
                  title: 'Going to Bath',
                  isDone: true,
                ),
                Todo(
                  title: 'Coding for 1hr',
                  isDone: false,
                ),
                Todo(),
              ],
            ),
            Positioned(
              bottom: 24.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => Taskpage(),
                    ),
                  );
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFFFE3577),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Image.asset('assets/images/delete_icon.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
