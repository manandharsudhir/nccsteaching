import 'package:uuid/uuid.dart';

class TodoModel {
  String id;
  bool isDone;
  String title;
  String description;

  TodoModel({
    required this.id,
    required this.title,
    this.description = "",
    this.isDone = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> jsonData) {
    return TodoModel(
      title: jsonData["title"],
      id: jsonData["_id"],
      description: jsonData["description"],
      isDone: jsonData["is_completed"],
    );
  }
}
