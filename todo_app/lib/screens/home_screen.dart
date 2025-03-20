import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Todo>> futureTodos;

  @override
  void initState() {
    super.initState();
    futureTodos = ApiService.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: FutureBuilder<List<Todo>>(
        future: futureTodos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Terjadi kesalahan"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Tidak ada todo"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final todo = snapshot.data![index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                );
              },
            );
          }
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../models/todo.dart';
// import '../services/api_service.dart';
// import '../widgets/todo_item.dart';
// import 'add_todo_screen.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Todo> todoList = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchTodos();
//   }

//   Future<void> fetchTodos() async {
//     try {
//       List<Todo> todos = await ApiService.fetchTodos();
//       setState(() {
//         todoList = todos;
//         isLoading = false;
//       });
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo List'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddTodoScreen()),
//               );
//             },
//           )
//         ],
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: todoList.length,
//               itemBuilder: (context, index) {
//                 return TodoItem(todo: todoList[index]);
//               },
//             ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'add_todo_screen.dart'; // Pastikan file ini tersedia

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo List'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddTodoScreen()),
//               );
//             },
//           )
//         ],
//       ),
//       body: Center(
//         child: Text('Daftar Todo Akan Muncul di Sini'),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../models/todo.dart';
// import '../widgets/todo_card.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Todo> todos = [
//     Todo(id: 1, title: "Belajar Flutter", category: "Kerjaan", priority: "Tinggi", deadline: DateTime.now().add(Duration(days: 1))),
//     Todo(id: 2, title: "Beli Sayur", category: "Belanja", priority: "Sedang", deadline: DateTime.now().add(Duration(days: 2))),
//     Todo(id: 3, title: "Olahraga", category: "Kesehatan", priority: "Rendah", deadline: DateTime.now().add(Duration(days: 3))),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo List'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (context, index) {
//           return TodoCard(todo: todos[index]);
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Tambahkan fungsi tambah todo nanti
//         },
//         child: Icon(Icons.add),
//         backgroundColor: Colors.blueAccent,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo List'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Center(
//         child: Text(
//           'Selamat datang di Todo App!',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
