import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';
class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color ? color;
  final Color iconColor;
  const IconAndTextWidget({Key? key,
  required this.text,
    this.color,
    required this.icon,
    required this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,),
        SmallText(text: text, color: color,),
      ],
    );
  }
}
