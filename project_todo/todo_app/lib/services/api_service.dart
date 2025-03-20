import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8000/api"; // Ganti dengan URL API kamu

  // Ambil daftar todo
  static Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse("$baseUrl/todos"));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception("Gagal mengambil data todo");
    }
  }

  // Tambah todo baru
  static Future<void> addTodo(Todo todo) async {
    final response = await http.post(
      Uri.parse("$baseUrl/todos"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(todo.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception("Gagal menambahkan todo");
    }
  }
}
