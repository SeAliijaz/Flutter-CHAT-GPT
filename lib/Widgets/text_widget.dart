import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  ///Variables
  final String label;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  ///const
  const TextWidget({
    Key? key,
    required this.label,
    this.fontSize = 18,
    this.color,
    this.fontWeight,
  }) : super(
          key: key,
        );

  /// @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        label,
        style: TextStyle(
          color: color ?? Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      ),
    );
  }
}
