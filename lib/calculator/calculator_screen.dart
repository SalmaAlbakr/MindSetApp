import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:next_poject/calculator/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  @override
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
      backgroundColor: Color(0xFF040626),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Container(
                      padding: EdgeInsets.all(50),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        backgroundColor: Color(0xFF070b33),
                        textColor: Color(0xFF9d0faa),
                      );
                    }

                    // √ button
                    else if (index == 1) {
                      return MyButton(
                        buttonText: buttons[index],
                        backgroundColor: Color(0xFF070b33),
                        textColor: Color(0xFF9d0faa),
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
                        backgroundColor: Color(0xFF070b33),
                        textColor: Color(0xFF9d0faa),
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
                        backgroundColor: Color(0xFF9d0faa),
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
                        backgroundColor: Color(0xFF070b33),
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
                            ? Color(0xFF9d0faa)
                            : Color(0xFF070b33),
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.white,
                      );
                    }
                  }), // GridView.builder
            ),
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