import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? fontSize;
  final Function()? onTap;

  const ClickableText({
    Key? key,
    this.title,
    this.color,
    this.fontSize,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          title ?? '',
          style: TextStyle(
            color: color,
            fontSize: fontSize ?? 32,
          ),
        ),
      ),
    );
  }
}
