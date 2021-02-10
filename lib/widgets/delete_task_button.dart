import 'package:Todoist/helpers/db_helper.dart';
import 'package:flutter/material.dart';

class DeleteTaskButton extends StatelessWidget {
  const DeleteTaskButton({
    Key key,
    @required int taskId,
    @required DatabaseHelper dbHelper,
  }) : _taskId = taskId, _dbHelper = dbHelper, super(key: key);

  final int _taskId;
  final DatabaseHelper _dbHelper;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24.0,
      right: 0.0,
      child: GestureDetector(
        onTap: () async {
          if (_taskId != 0) {
            await _dbHelper.deleteTask(_taskId);
            Navigator.pop(context);
          }
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
            child: Icon(
              Icons.delete_forever_rounded,
              color: Colors.white,
              size: 30,
            )),
      ),
    );
  }
}