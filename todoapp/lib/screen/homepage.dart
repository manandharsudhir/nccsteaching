import 'package:flutter/material.dart';
import 'package:todoapp/model/todo_model.dart';

import '../widget/todoitem_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TodoModel> todos = [
      TodoModel(id: 1, title: "title1"),
      TodoModel(id: 2, title: "title2"),
      TodoModel(id: 3, title: "title3"),
      TodoModel(id: 4, title: "title4"),
      TodoModel(id: 5, title: "title5"),
      TodoModel(id: 6, title: "title6"),
    ];
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
          print(data);
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
