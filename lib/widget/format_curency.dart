import 'package:flutter/material.dart';

class NumberFormatText extends StatelessWidget {
  final int? number;
  final String? exstarText;
  final TextStyle? style;

  NumberFormatText({this.number,this.style,this.exstarText});

  @override
  Widget build(BuildContext context) {
    String formattedNumber = number.toString();
    int length = formattedNumber.length;
     int dotCount = (length - 1) ~/ 3;
      // print('banyaknya titik : $dotCount');
      for (int i = 1; i <= dotCount; i++) {
        formattedNumber = formattedNumber.substring(0, length - (i * 3)) +
            '.' +
            formattedNumber.substring(length - (i * 3));
      }
    return Text(exstarText==null? formattedNumber : '$exstarText $formattedNumber',style: style,);
  }
}
