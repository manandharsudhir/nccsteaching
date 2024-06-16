import 'package:flutter/material.dart';

class MyIdHomepage extends StatelessWidget {
  const MyIdHomepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.network(
            "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg")
      ],
    ));
  }
}
