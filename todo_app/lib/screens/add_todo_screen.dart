import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/api_service.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController titleController = TextEditingController();
  String selectedPriority = "Sedang";
  String selectedCategory = "Umum";

  void saveTodo() async {
    Todo newTodo = Todo(
      id: 0,
      title: titleController.text,
      priority: selectedPriority,
      category: selectedCategory,
      description: "",
      deadline: DateTime.now().add(Duration(days: 1)), // Set default deadline
    );

    await ApiService.addTodo(newTodo);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Judul Todo'),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedPriority,
              onChanged: (value) {
                setState(() {
                  selectedPriority = value!;
                });
              },
              items: ["Rendah", "Sedang", "Tinggi"]
                  .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                  .toList(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: saveTodo,
              child: Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class AddTodoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Tambah Todo')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(labelText: 'Judul Todo'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Simpan'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
