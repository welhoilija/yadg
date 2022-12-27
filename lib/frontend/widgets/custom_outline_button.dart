import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final Color color;

  const CustomOutlineButton(
      {super.key, required this.text, this.onPressed, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => onPressed != null ? onPressed!() : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
