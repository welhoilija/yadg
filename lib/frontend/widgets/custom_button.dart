import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final Color color;

  const CustomButton(
      {super.key, required this.text, this.onPressed, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onPressed != null ? onPressed!() : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size.fromHeight(50),
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
