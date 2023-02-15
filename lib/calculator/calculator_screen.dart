import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  //double firstNum = 0.0;
  //double secondNum = 0.0;
  var input = "";
  var output = "";
  var hideInput = false;
  //var operation = "";

  action(value) {
    if (value == "AC") {
      input = "";
      output = "";
    } else if (value == "C") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("X", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;

        hideInput = true;
      }
    } else {
      input = input + value;
      hideInput = false;
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      hideInput ? "" : input,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      output,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              height: 250,
            ),
            Container(
              height: 430,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.orangeAccent,
                          numberOfButton: "AC"),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.redAccent,
                          numberOfButton: "C"),
                      // ButtonWidget(
                      //     textColor: Colors.white,
                      //     backgroundColor: Colors.black,
                      //     numberOfButton: ""),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.grey,
                          numberOfButton: "/"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          numberOfButton: "7"),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          numberOfButton: "8"),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          numberOfButton: "9"),
                      ButtonWidget(
                          textColor: Colors.white,
                           backgroundColor: Colors.grey,
                          numberOfButton: "X"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          numberOfButton: "4"),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          numberOfButton: "5"),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          numberOfButton: "6"),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.grey,
                          numberOfButton: "-"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          numberOfButton: "1"),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          numberOfButton: "2"),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          numberOfButton: "3"),
                      ButtonWidget(
                        textColor: Colors.white,
                        backgroundColor: Colors.grey,
                        numberOfButton: "+",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.grey,
                          numberOfButton: "%"),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.black,
                          numberOfButton: "0"),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.grey,
                          numberOfButton: "."),
                      ButtonWidget(
                          textColor: Colors.white,
                          backgroundColor: Colors.orangeAccent,
                          numberOfButton: "="),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ButtonWidget({numberOfButton, backgroundColor, textColor}) {
    return GestureDetector(
      onTap: () => action(numberOfButton),
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: 40,
        child: Text(
          numberOfButton!,
          style: TextStyle(color: textColor, fontSize: 35),
        ),
      ),
    );
  }
}
