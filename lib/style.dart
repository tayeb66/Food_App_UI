import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final double? height;

  const PrimaryText(
      {super.key, this.text, this.color, this.size, this.fontWeight,this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
