import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/model/todo_model.dart';

final counterStateProvider = StateProvider<int>((ref) => 0);

final todoProvider = StateProvider<List<TodoModel>>((ref) => []);
