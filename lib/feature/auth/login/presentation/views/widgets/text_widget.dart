import 'package:flutter/cupertino.dart';
import '../../../../../../constants.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double size;
  final Color color;

  const TextWidget({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
    this.color = fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(text,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
        ));
  }
}