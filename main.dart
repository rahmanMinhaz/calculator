import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';
  String Value = '0';
  double one = 0;
  double two = 0;
  String operator = "";
  String history = "";

  Widget Button(String buttonValue, int flexValue) {
    return Expanded(
      flex: flexValue,
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 206, 198, 235),
          ),
          onPressed: () {
            setState(() {
              if (buttonValue == 'AC') {
                Value = '0';
                one = 0;
                two = 0;
                operator = "";
              } else if (buttonValue == '+' ||
                  buttonValue == '-' ||
                  buttonValue == 'x' ||
                  buttonValue == '/' ||
                  buttonValue == '%') {
                one = double.parse(output);
                operator = buttonValue;
                Value = '0';
              } else if (buttonValue == '.') {
                Value = Value + buttonValue;
              } else if (buttonValue == "=") {
                two = double.parse(output);

                if (operator == '+') {
                  Value = (one + two).toString();
                } else if (operator == '-') {
                  Value = (one - two).toString();
                } else if (operator == 'x') {
                  Value = (one * two).toString();
                } else if (operator == '/') {
                  Value = (one / two).toString();
                } else if (operator == '%') {
                  Value = (one % two).toString();
                }

                one = 0;
                two = 0;
                operator = "";
              } else {
                Value = Value + buttonValue;
              }
              setState(() {
                output = double.parse(Value).toStringAsFixed(2);
              });

              if (buttonValue != 'AC') {
                history = history + buttonValue;
              } else {
                history = '';
              }
            });
          },
          child: Container(
            child: Text(
              buttonValue,
              style:
                  TextStyle(fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            padding: EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 136, 201, 233),
          width: 600.0,
          height: 800.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  color: Color.fromARGB(
                      255, 204, 204, 202), // Set your desired background color
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        child: Text(
                          history,
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: Text(
                          output,
                          style: TextStyle(
                            fontSize: 60,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Button("AC", 2),
                      Button("=", 2),
                    ],
                  ),
                  Row(
                    children: [
                      Button("7", 1),
                      Button("8", 1),
                      Button("9", 1),
                      Button("x", 1),
                    ],
                  ),
                  Row(
                    children: [
                      Button("4", 1),
                      Button("5", 1),
                      Button("6", 1),
                      Button("+", 1),
                    ],
                  ),
                  Row(
                    children: [
                      Button("1", 1),
                      Button("2", 1),
                      Button("3", 1),
                      Button("-", 1),
                    ],
                  ),
                  Row(
                    children: [
                      Button("0", 1),
                      Button("%", 1),
                      Button("/", 2),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
