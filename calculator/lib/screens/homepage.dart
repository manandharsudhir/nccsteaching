import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff15181F),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //Output Display
              Text(
                "985",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.bold),
              ),
              //input Display
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xff21242E),
                ),
                child: Text(
                  "985",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  children: [
                    CalculatorNumpadItemWIdget(
                      value: "7",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "8",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "9",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "X",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorNumpadItemWIdget extends StatelessWidget {
  const CalculatorNumpadItemWIdget({super.key, required this.value});

  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff373F4C),
      child: Center(
        child: Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
