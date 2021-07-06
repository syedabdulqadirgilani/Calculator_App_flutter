import 'package:calculator_app/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String expression = "";
  String history = "";

  void numClick(String text) {
    setState(() {
      expression += text;
    });
  }

  void clear(String text) {
    setState(() {
      expression = '';
    });
  }

  void allClear(String text) {
    setState(() {
      history = '';
      expression = '';
    });
  }

  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);    
    setState(() {
      history = expression;
      expression = eval.toString();
      

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  history,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF545F61),
                    ),
                  ),
                ),
                alignment: Alignment(1, 1),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  expression,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                alignment: Alignment(1, 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyCalc(
                    text: 'AC',
                    fillColor: 0xFF6C807F,
                    textColor: 0xFFFFFFFF,
                    textsize: 15,
                    callBack: allClear,
                  ),
                  MyCalc(
                    text: 'C',
                    fillColor: 0xFF6C807F,
                    textColor: 0xFFFFFFFF,
                    textsize: 21,
                    callBack: clear,
                  ),
                  MyCalc(
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF26A69A,
                    textsize: 20,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF26A69A,
                    textsize: 20,
                    callBack: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyCalc(
                    text: '7',
                    fillColor: 0,
                    textColor: 0xFFFFFFFF,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '8',
                    fillColor: 0,
                    textColor: 0xFFFFFFFF,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '9',
                    textColor: 0xFFFFFFFF,
                    fillColor: 0,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF26A69A,
                    textsize: 20,
                    callBack: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyCalc(
                    text: '4',
                    fillColor: 0,
                    textColor: 0xFFFFFFFF,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '5',
                    fillColor: 0,
                    textColor: 0xFFFFFFFF,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '6',
                    textColor: 0xFFFFFFFF,
                    fillColor: 0,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF26A69A,
                    textsize: 25,
                    callBack: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyCalc(
                    text: '1',
                    fillColor: 0,
                    textColor: 0xFFFFFFFF,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '2',
                    fillColor: 0,
                    textColor: 0xFFFFFFFF,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '3',
                    textColor: 0xFFFFFFFF,
                    fillColor: 0,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF26A69A,
                    textsize: 25,
                    callBack: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyCalc(
                    text: '.',
                    fillColor: 0,
                    textColor: 0xFFFFFFFF,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '0',
                    fillColor: 0,
                    textColor: 0xFFFFFFFF,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '00',
                    textColor: 0xFFFFFFFF,
                    fillColor: 0,
                    textsize: 18,
                    callBack: numClick,
                  ),
                  MyCalc(
                    text: '=',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF26A69A,
                    textsize: 25,
                    callBack: evaluate,
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