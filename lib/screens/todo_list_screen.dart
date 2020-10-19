import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  Widget _buildTask(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text('Task tile'),
            subtitle: Text('Oct 2 2019'),
            trailing: Checkbox(
              onChanged: (value) {},
              activeColor: Theme.of(context).primaryColor,
              value: true,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('navigating'),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Tasks',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '3 of 8',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }
          return _buildTask(index);
        },
        itemCount: 8,
      ),
    );
  }
}
