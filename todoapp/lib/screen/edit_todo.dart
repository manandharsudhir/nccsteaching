import 'package:flutter/material.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:uuid/uuid.dart';

class EditTodoPage extends StatefulWidget {
  EditTodoPage({super.key, required this.todoModel});

  final TodoModel todoModel;

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController.text = widget.todoModel.title;
    descriptionController.text = widget.todoModel.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   print(titleController.text);
      //   titleController.text = titleController.text + "manandhar";
      // }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.of(context).pop(TodoModel(
                id: Uuid().v4(),
                title: titleController.text,
                description: descriptionController.text,
              ));
            }
          },
          child: Text(
            "Save",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if ((value ?? "").isEmpty) {
                    return "Field Cannot be empty";
                  } else {
                    return null;
                  }
                },
                // onChanged: (value) {
                //   print(value);
                // },
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Enter your title",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: descriptionController,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Description",
                  hintText: "Enter Description",
                ),
              ),
              // DropdownButtonFormField<String>(
              //   hint: Text("Select option"),
              //   items: [
              //     DropdownMenuItem(
              //       child: Text("Data 1"),
              //       value: "data1",
              //     ),
              //     DropdownMenuItem(
              //       child: Text("Data 2"),
              //       value: "data2",
              //     ),
              //   ],
              //   onChanged: (value) {},
              // )
              // Row(
              //   children: [
              //     Radio(
              //       value: true,
              //       groupValue: "groupValue",
              //       onChanged: (value) {},
              //     ),
              //     Text("data")
              //   ],
              // ),
              // Radio(
              //   value: false,
              //   groupValue: "groupValue",
              //   onChanged: (value) {},
              // )
            ],
          )),
    );
  }
}
