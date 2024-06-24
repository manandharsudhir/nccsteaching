import 'package:flutter/material.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).pop();

          Navigator.pop(context);
          //Define what data is to be passed when popping
          // Navigator.pop<String>(context, "hello");
        },
      ),
    );
  }
}
