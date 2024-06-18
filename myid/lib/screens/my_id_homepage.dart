import 'package:flutter/material.dart';

class MyIdHomepage extends StatelessWidget {
  const MyIdHomepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
          height: 400,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Divider(
          thickness: 20,
          color: Colors.amber,
          // color: Color(0xfff1f1f1f1),
          // color: Color.fromRGBO(125, 130, 125, 1),
        ),
        Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/logo/company-logo.png",
                height: 60,
                width: 60,
              ),
              Text(
                "Sudhir Mananadhar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Manamaiju,Kathmandu",
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.phone),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Lorem Ipsum"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.phone,
                      color: Colors.yellow,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Lorem Ipsum"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.phone),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Lorem Ipsum"),
                ],
              )
            ],
          ),
        ),

        //This can also be done
        // Container(
        //   height: 20,
        //   decoration: BoxDecoration(
        //     color: Colors.amber,
        //   ),
        // )
      ],
    ));
  }
}
