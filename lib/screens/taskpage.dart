import 'package:Todoist/helpers/db_helper.dart';
import 'package:Todoist/models/task.dart';
import 'package:Todoist/widgets/delete_task_button.dart';
import 'package:Todoist/widgets/todo.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart' as modelTodo;

class Taskpage extends StatefulWidget {
  final Task task;
  Taskpage({@required this.task});
  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  String _taskTitle = "";
  int _taskId = 0;
  String _taskDescription = "";

  FocusNode _titleFocus;
  FocusNode _descriptionFocus;
  FocusNode _todoFocus;

  bool _contentVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _contentVisible = true;

      _taskTitle = widget.task.title;
      _taskDescription = widget.task.description;
      _taskId = widget.task.id;
    }
    _titleFocus = FocusNode();
    _descriptionFocus = FocusNode();
    _todoFocus = FocusNode();
  }

  @override
  void dispose() {
    _titleFocus.dispose();
    _descriptionFocus.dispose();
    _todoFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black54,
              size: 30,
            )),
        backgroundColor: Color(0xFFF6F6F6),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  bottom: 3,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.pending_actions,
                      size: 30,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: _titleFocus,
                        onSubmitted: (value) async {
                          if (value != "") {
                            if (widget.task == null) {
                              Task _newTask = Task(
                                title: value,
                              );
                              _taskId = await _dbHelper.insertTask(_newTask);
                              setState(() {
                                _contentVisible = true;
                                _taskTitle = value;
                              });
                            } else {
                              await _dbHelper.updateTaskTitle(
                                  _taskId, _taskTitle);
                            }
                          }
                          _descriptionFocus.requestFocus();
                        },
                        controller: TextEditingController()..text = _taskTitle,
                        decoration: InputDecoration(
                          hintText: 'Enter Task Title',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color(0xff211551),
                          fontSize: 24,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Visibility(
                      visible: _contentVisible,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextField(
                          focusNode: _descriptionFocus,
                          onSubmitted: (value) async {
                            if (value != "") {
                              if (_taskId != 0) {
                                await _dbHelper.updateTaskDescription(
                                    _taskId, value);
                                setState(() {
                                  _taskDescription = value;
                                });
                              }
                            }
                            _todoFocus.requestFocus();
                          },
                          controller: TextEditingController()
                            ..text = _taskDescription,
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
                    ),
                    Visibility(
                      visible: _contentVisible,
                      child: Expanded(
                        child: FutureBuilder(
                          initialData: [],
                          future: _dbHelper.getTodo(_taskId),
                          builder: (context, snapshot) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (snapshot.data[index].isDone == 0) {
                                      await _dbHelper.updateTodoDone(
                                          snapshot.data[index].id, 1);
                                    } else {
                                      await _dbHelper.updateTodoDone(
                                          snapshot.data[index].id, 0);
                                    }
                                    setState(() {});
                                  },
                                  child: Todo(
                                    title: snapshot.data[index].title,
                                    isDone: snapshot.data[index].isDone == 0
                                        ? false
                                        : true,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _contentVisible,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
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
                                  color: Colors.grey[200],
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
                            Expanded(
                              child: TextField(
                                focusNode: _todoFocus,
                                controller: TextEditingController()..text = "",
                                onSubmitted: (value) async {
                                  if (value != "") {
                                    if (_taskId != 0) {
                                      DatabaseHelper _dbHelper =
                                          DatabaseHelper();
                                      modelTodo.Todo _newTodo = modelTodo.Todo(
                                        title: value,
                                        isDone: 0,
                                        taskId: _taskId,
                                      );
                                      await _dbHelper.insertTodo(_newTodo);
                                      setState(() {
                                        _todoFocus.requestFocus();
                                      });
                                    }
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter todo item',
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: _contentVisible,
            child: DeleteTaskButton(taskId: _taskId, dbHelper: _dbHelper),
          ),
        ],
      ),
    );
  }
}
