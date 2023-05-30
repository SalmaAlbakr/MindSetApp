import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:MindSet/calculator/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var userInput = '';
  var answer = '';
final iconB = Icons.ac_unit_sharp.toString();

  final List<String> buttons = [
    'C',
    '√',
    '^',
    'DEL',
    '7',
    '8',
    '9',
    '+',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    'x',
    '0',
    '.',
    '=',
    '/',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040626),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Container(
                      padding: const EdgeInsets.all(40),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {


                  // C Button
                  if (index == 0) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userInput = '';
                          answer = '0';
                        });
                      },
                      buttonText: buttons[index],
                      backgroundColor: const Color(0xFF070b33),
                      textColor: const Color(0xFF9d0faa),
                    );
                  }

                  // √ button
                  else if (index == 1) {
                    return MyButton(
                      buttonText: buttons[index],
                      backgroundColor: const Color(0xFF070b33),
                      textColor: const Color(0xFF9d0faa),
                      buttonTapped: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                    );
                  }
                  // ^ Button
                  else if (index == 2) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      backgroundColor: const Color(0xFF070b33),
                      textColor: const Color(0xFF9d0faa),
                    );
                  }
                  // Del Button
                  else if (index == 3) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      backgroundColor: const Color(0xFF9d0faa),
                      textColor: Colors.white,
                    );
                  }

                  // = Button
                  else if (index == 18) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      backgroundColor: const Color(0xFF070b33),
                      textColor: Colors.white,
                    );
                  }

                  // other buttons
                  else {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      backgroundColor: isOperator(buttons[index])
                          ? const Color(0xFF9d0faa)
                          : const Color(0xFF070b33),
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.white,
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }


  void equalPressed() {
    String finalUserInput = userInput;

    finalUserInput = userInput.replaceAll('x', '*').replaceAll('√', 'sqrt');

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
    if (answer.endsWith('.0')) {
      answer = answer.substring(0, answer.length - 2);
    }
  }
}