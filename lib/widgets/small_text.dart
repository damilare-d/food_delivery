import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double height;
  double size;

  SmallText({Key? key,
    this.size=12,
    this.color = const Color (0xFFccc7c5),
    this.height =1.2,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily:'Roboto',
          fontSize: size,
          fontWeight: FontWeight.w400,
          color : color),


    );
  }
}
