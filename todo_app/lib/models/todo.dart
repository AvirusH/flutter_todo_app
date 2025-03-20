class Todo {
  final int id;
  final String title;
  final String priority;
  final String category;
  final DateTime deadline;
  final String description;

  Todo({
    required this.id,
    required this.title,
    required this.priority,
    required this.category,
    required this.deadline,
    required this.description,
  });

  // Konversi dari JSON
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      priority: json['priority'],
      category: json['category'],
      description: json['description'],
      deadline: DateTime.parse(json['deadline']),
    );
  }

  // Konversi ke JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priority': priority,
      'category': category,
      'deadline': deadline.toIso8601String(),
    };
  }
}

// class Todo {
//   final int id;
//   final String title;
//   final String category;
//   final String priority;
//   final DateTime deadline;

//   Todo({
//     required this.id,
//     required this.title,
//     required this.category,
//     required this.priority,
//     required this.deadline,
//   });

//   factory Todo.fromJson(Map<String, dynamic> json) {
//     return Todo(
//       id: json['id'],
//       title: json['title'],
//       category: json['category'],
//       priority: json['priority'],
//       deadline: DateTime.parse(json['deadline']),
//     );
//   }
// }
