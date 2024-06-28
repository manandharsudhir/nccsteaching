import 'package:flutter/material.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/screen/edit_todo.dart';
import 'package:todoapp/services/api_service.dart';

import '../widget/todoitem_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<TodoModel> todos = [];
  bool isLoading = false;
  ApiService apiService = ApiService();

  getTodos() async {
    setState(() {
      isLoading = true;
    });
    final responseTodo = await apiService.get("/todos");
    setState(() {
      //another variation/for understanding
      // final todoItems = (responseTodo["items"] as List);
      // for (int i = 0; i < todoItems.length; i++) {
      //   todos.add(TodoModel.fromJson(todoItems[i]));
      // }
      todos = (responseTodo["items"] as List)
          .map((e) => TodoModel.fromJson(e))
          .toList();
      isLoading = false;
    });
  }

  @override
  void initState() {
    getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Todos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return AddTodoPage();
          //     },
          //   ),
          // );
          final data = await Navigator.pushNamed(context, "/addTodo");
          setState(() {
            todos.add(data as TodoModel);
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return TodoItem(
                  title: todos[index].title,
                  onDelete: () {
                    setState(() {
                      todos.removeAt(index);
                    });
                  },
                  onEdit: () async {
                    final data = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditTodoPage(
                          todoModel: todos[index],
                        ),
                      ),
                    );
                    setState(() {
                      todos[index] = data as TodoModel;
                    });
                  },
                );
              },
              itemCount: todos.length,
            ),
    );
  }
}
