import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text("Kategori: ${todo.category} - Prioritas: ${todo.priority}"),
        trailing: Text("${todo.deadline.toLocal()}"),
      ),
    );
  }
}
