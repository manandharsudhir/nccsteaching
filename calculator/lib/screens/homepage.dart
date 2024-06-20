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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
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
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    CalculatorNumpadItemWIdget(
                      value: "AC",
                      colSpan: 2,
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "%",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "/",
                    ),
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
                      value: "x",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "4",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "5",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "6",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "-",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "1",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "2",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "3",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "+",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "0",
                      colSpan: 2,
                    ),
                    CalculatorNumpadItemWIdget(
                      value: ".",
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "=",
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
  const CalculatorNumpadItemWIdget({
    super.key,
    required this.value,
    this.colSpan = 4,
  });
  final int colSpan;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff373F4C),
      width: (MediaQuery.of(context).size.width / colSpan) - 8,
      height: (MediaQuery.of(context).size.height / 8),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
