import 'package:flutter/material.dart';
import 'package:todoapp/screen/add_todo.dart';

import '../widget/todoitem_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({
    super.key,
  });

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
          print(data);
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TodoItem(
            title: "Task 1000",
          ),
        ],
      ),
    );
  }
}
