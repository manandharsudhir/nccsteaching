import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
      if (value == "AC") {
        inputValues = "";
      } else {
        inputValues += value;
      }
    });
    // print(inputValues);
  }

  void onEqualPressed() {
    String toCaluculate = inputValues.replaceAll("X", "*");
    try {
      Parser p = Parser();
      Expression exp = p.parse(toCaluculate);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        finalOutput = eval.toString();
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        finalOutput = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("building");
    return Scaffold(
      backgroundColor: Color(0xff15181F),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //Output Display
              Expanded(
                flex: 2,
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
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xff21242E),
                        ),
                        child: FittedBox(
                          alignment: Alignment.centerRight,
                          child: Text(
                            inputValues,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                flex: 7,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  runAlignment: WrapAlignment.end,
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
                        onTappedValue("X");
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
                        onEqualPressed();
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
        height: (MediaQuery.of(context).size.height / 8.5),
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
