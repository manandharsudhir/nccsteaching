class TodoModel {
  int id;
  bool isDone;
  String title;
  String description;

  TodoModel({
    required this.id,
    required this.title,
    this.description = "",
    this.isDone = false,
  });
}
