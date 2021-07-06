import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCalc extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textsize;
  final Function callBack;

  const MyCalc(
      {Key? key,
      required this.text,
      required this.fillColor,
      this.textColor = 0xFFFFFFFF,
      this.textsize = 24,
      required this.callBack
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 55,
        width: 55,
        child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          child: Text(
            
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textsize,
                color: Color(textColor),
              ),
            ),
          ),
          onPressed: () {
            callBack(text);
          },
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
