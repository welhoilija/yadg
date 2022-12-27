import 'package:flutter/material.dart';

class PlayerTile extends StatelessWidget {
  final String name;
  final Function onPressed;

  const PlayerTile({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Card(
        child: ListTile(
          title: Text(name),
          trailing: IconButton(
              onPressed: () => onPressed(),
              icon: const Icon(Icons.cancel_outlined)),
        ),
      ),
    );
  }
}
