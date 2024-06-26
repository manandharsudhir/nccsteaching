import 'package:uuid/uuid.dart';

class TodoModel {
  String id;
  bool isDone;
  String title;
  String description;

  TodoModel({
    required this.title,
    this.description = "",
    this.isDone = false,
  }) : id = Uuid().v4();
}
