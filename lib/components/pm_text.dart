import 'package:flutter/material.dart';

class PmText extends StatelessWidget {

  final String text;
  final Color? color;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;

  const PmText({super.key, required this.text, this.color, this.maxLines, this.fontWeight, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontFamily: 'NeoSans',
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      maxLines: maxLines ?? 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
