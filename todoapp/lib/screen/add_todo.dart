import 'package:flutter/material.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/services/api_service.dart';
import 'package:uuid/uuid.dart';

class AddTodoPage extends StatefulWidget {
  AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ApiService apiService = ApiService();

  bool isLoading = false;

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
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              setState(() {
                isLoading = true;
              });
              try {
                TodoModel todo = TodoModel(
                  id: Uuid().v4(),
                  title: titleController.text,
                  description: descriptionController.text,
                  isDone: false,
                );
                final response =
                    await apiService.post("/todos", body: todo.toJson());
                todo = TodoModel.fromJson(response["data"]);

                Navigator.of(context).pop(todo);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Error: $e"),
                ));
              } finally {
                setState(() {
                  isLoading = false;
                });
              }
            }
          },
          child: isLoading
              ? CircularProgressIndicator()
              : Text(
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
