import 'package:flutter/material.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/screen/edit_todo.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Todos"),
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
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
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
