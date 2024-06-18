// task_manager.dart
import 'package:flutter/material.dart';

class TaskManagerPage extends StatefulWidget {
  @override
  _TaskManagerPageState createState() => _TaskManagerPageState();
}

class _TaskManagerPageState extends State<TaskManagerPage> {
  final List<String> _taskList = <String>[];
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Менеджер задач'),
      ),
      body: ListView.builder(
        itemCount: _taskList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_taskList[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        tooltip: 'Добавить задачу',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Добавить задачу'),
          content: TextField(
            controller: _taskController,
            decoration: InputDecoration(hintText: 'Введите задачу здесь'),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Добавить'),
              onPressed: () {
                setState(() {
                  _taskList.add(_taskController.text);
                });
                _taskController.clear();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Отмена'),
              onPressed: () {
                _taskController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
