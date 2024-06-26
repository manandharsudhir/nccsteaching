import 'package:flutter/material.dart';
import 'package:todoapp/model/todo_model.dart';

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
          return TodoItem(title: todos[index].title);
        },
        itemCount: todos.length,
      ),
    );
  }
}
