import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Pelaajat",
      style: TextStyle(
        fontSize: 40,
        color: Colors.red,
      ),
    );
  }
}
