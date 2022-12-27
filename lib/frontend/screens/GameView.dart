import 'package:flutter/material.dart';
import 'package:yadg/frontend/widgets/custom_outline_button.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(), // To align CardWidget to center
          const CardWidget(),
          const ButtonRow()
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "🤔",
            style: TextStyle(
              fontSize: 64,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "Aloittakaa peli antamalla pelaajalle Iikka 4 hörppyä.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonRow extends StatefulWidget {
  const ButtonRow({super.key});

  @override
  State<ButtonRow> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
      child: Row(
        children: [
          const CustomOutlineButton(
            text: "FAIL",
            color: Colors.red,
          ),
          Container(width: 12),
          const CustomOutlineButton(
            text: "NEXT",
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
