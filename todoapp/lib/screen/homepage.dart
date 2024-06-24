import 'package:flutter/material.dart';

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
      body: ListView(
        children: [
          TodoItem(
            title: "Task 1000",
          ),
        ],
      ),
    );
  }
}
