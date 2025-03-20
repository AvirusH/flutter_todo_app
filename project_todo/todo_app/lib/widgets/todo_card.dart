import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  TodoCard({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(todo.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kategori: ${todo.category}"),
            Text("Prioritas: ${todo.priority}"),
            Text("Deadline: ${todo.deadline.toLocal()}"),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            // Tambahkan fungsi hapus nanti
          },
        ),
      ),
    );
  }
}
