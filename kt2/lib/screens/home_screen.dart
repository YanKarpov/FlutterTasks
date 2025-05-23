import 'package:flutter/material.dart';
import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void addTask(String title) {
    setState(() {
      tasks.add(Task(
        id: DateTime.now().toString(),
        title: title,
        isCompleted: false,
        createdAt: DateTime.now(),
      ));
    });
  }

  void toggleTaskStatus(String id) {
    setState(() {
      final task = tasks.firstWhere((task) => task.id == id);
      task.isCompleted = !task.isCompleted;
    });
  }

  void deleteTask(String id) {
    setState(() {
      tasks.removeWhere((task) => task.id == id);
    });
  }

  void editTask(String id, String newTitle) {
    setState(() {
      final task = tasks.firstWhere((task) => task.id == id);
      task.title = newTitle;
    });
  }

  Future<void> _showEditDialog(BuildContext context, Task task) async {
    final TextEditingController controller = TextEditingController(text: task.title);

    final String? newTitle = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Редактировать задачу'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(hintText: 'Введите новый текст задачи'),
            onSubmitted: (newTitle) {
              Navigator.of(context).pop(newTitle);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: Text('Сохранить'),
            ),
          ],
        );
      },
    );

    if (newTitle != null && newTitle.isNotEmpty) {
      editTask(task.id, newTitle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список дел'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            leading: Checkbox(
              value: task.isCompleted,
              onChanged: (value) {
                toggleTaskStatus(task.id);
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteTask(task.id),
            ),
            onTap: () {
              _showEditDialog(context, task);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await showDialog<String>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Добавить задачу'),
                content: TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: 'Название задачи'),
                  onSubmitted: Navigator.of(context).pop,
                ),
              );
            },
          );
          if (newTask != null && newTask.isNotEmpty) {
            addTask(newTask);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}