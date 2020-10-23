import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  /* A FormState object can be used to save, reset, and validate every FormField that is a descendant of the associated Form.*/
  /*Creates a [LabeledGlobalKey], which is a [GlobalKey] with a label used for debugging.
  The label is purely for debugging and not used for comparing the identity of the key.*/
  final _fromKey = GlobalKey<FormState>();
  String _title = '';
  String priority;
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Add Task',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.0,),
  



        ],
      ),
    );
  }
}
