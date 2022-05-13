import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
final Color? color;
final String text;
double size;
TextOverflow overFlow;

  BigText({Key? key, this.overFlow=TextOverflow.ellipsis,this.color,this.size=20,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow:overFlow,
     style: TextStyle(
         fontFamily:'Roboto',
         fontSize: size,
         fontWeight: FontWeight.w400,
         color : color),


    );
  }
}
