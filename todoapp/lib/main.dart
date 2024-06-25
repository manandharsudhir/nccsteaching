import 'package:flutter/material.dart';
import 'package:todoapp/screen/add_todo.dart';

import 'screen/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow,
        primarySwatch: Colors.yellow,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.yellow),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow,
        ),
      ),
      routes: {
        "/home": (context) => Homepage(),
        "/addTodo": (context) => AddTodoPage(),
      },
      home: Homepage(),
    );
  }
}
