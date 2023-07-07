import 'package:flutter/material.dart';

void main() => runApp(Calc());

class Calc extends StatelessWidget {
  const Calc({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

@override
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  var operand = "";

  buttonpressed(String buttontext) {
    if (buttontext == "C") {
      _output = "0";
      var num1 = 0;
      var num2 = 0;
      var operand = "";
    } else if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "*" ||
        buttontext == "/") {
      num1 = double.parse(output);
      operand = buttontext;
      _output = "0";
    } else if (buttontext == ".") {
      if (_output.contains(".")) {
        print("Already present");
      } else {
        _output = _output + buttontext;
      }
    } else if (buttontext == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttontext;
    }
    print(output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildbutton(String buttontext) {
    return Expanded(
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: OutlinedButton(
            child: Text(
              buttontext,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onPressed: () => buttonpressed(buttontext),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 13),
              child: Text(
                output,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Expanded(child: Divider()),
            new Column(
              children: [
                new Row(
                  children: [
                    buildbutton("7"),
                    buildbutton("8"),
                    buildbutton("9"),
                    buildbutton("/"),
                  ],
                ),
                new Row(
                  children: [
                    buildbutton("4"),
                    buildbutton("5"),
                    buildbutton("6"),
                    buildbutton("*"),
                  ],
                ),
                new Row(
                  children: [
                    buildbutton("1"),
                    buildbutton("2"),
                    buildbutton("3"),
                    buildbutton("-"),
                  ],
                ),
                new Row(
                  children: [
                    buildbutton("."),
                    buildbutton("0"),
                    buildbutton("00"),
                    buildbutton("+"),
                  ],
                ),
                new Row(
                  children: [
                    buildbutton("C"),
                    buildbutton("="),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
