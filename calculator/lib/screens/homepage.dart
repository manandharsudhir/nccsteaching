import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String finalOutput = "";
  String inputValues = "";

  void onTappedValue(String value) {
    setState(() {
      inputValues += value;
    });
    print(inputValues);
  }

  @override
  Widget build(BuildContext context) {
    print("building");
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
                      finalOutput,
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
                        inputValues,
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
                      onTap: () {
                        onTappedValue("AC");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "%",
                      onTap: () {
                        onTappedValue("%");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "/",
                      onTap: () {
                        onTappedValue("/");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "7",
                      onTap: () {
                        onTappedValue("7");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "8",
                      onTap: () {
                        onTappedValue("8");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "9",
                      onTap: () {
                        onTappedValue("9");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "x",
                      onTap: () {
                        // onTappedValue("x");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "4",
                      onTap: () {
                        onTappedValue("4");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "5",
                      onTap: () {
                        onTappedValue("5");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "6",
                      onTap: () {
                        onTappedValue("6");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "-",
                      onTap: () {
                        onTappedValue("-");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "1",
                      onTap: () {
                        onTappedValue("1");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "2",
                      onTap: () {
                        onTappedValue("2");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "3",
                      onTap: () {
                        onTappedValue("3");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "+",
                      onTap: () {
                        onTappedValue("+");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "0",
                      colSpan: 2,
                      onTap: () {
                        onTappedValue("0");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: ".",
                      onTap: () {
                        onTappedValue(".");
                      },
                    ),
                    CalculatorNumpadItemWIdget(
                      value: "=",
                      onTap: () {
                        onTappedValue("=");
                      },
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
    required this.onTap,
  });
  final int colSpan;
  final String value;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
