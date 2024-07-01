import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/services/api_service.dart';

final todoProvider = FutureProvider<List<TodoModel>>((ref) async {
  ApiService apiService = ApiService();
  final responseTodo = await apiService.get("/todos");
  return (responseTodo["items"] as List)
      .map((e) => TodoModel.fromJson(e))
      .toList();
});
