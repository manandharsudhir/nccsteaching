class TodoModel {
  bool isDone;
  String title;
  String description;

  TodoModel({
    required this.title,
    this.description = "",
    this.isDone = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> jsonData) {
    return TodoModel(
      title: jsonData["title"],
      description: jsonData["description"],
      isDone: jsonData["is_completed"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "descripton": description,
      "is_completed": isDone,
    };
  }
}
