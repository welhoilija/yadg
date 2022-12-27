import 'package:flutter/material.dart' hide Card;
import 'package:yadg/backend/backend.dart';
import 'package:yadg/backend/card.dart';
import 'package:yadg/frontend/widgets/custom_outline_button.dart';

class GameView extends StatefulWidget {
  final Backend backend;

  const GameView({super.key, required this.backend});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late Card _currentCard;

  @override
  void initState() {
    _currentCard = widget.backend.getNextCard();
    super.initState();
  }

  void fail() {
    setState(() {
      if (_currentCard.punishment != null && _currentCard.punishment!) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Rangaistuskorttia ei voi skipata!"),
          ),
        );
      } else {
        _currentCard.failCard();
        _currentCard = widget.backend.getNextCard();
      }
    });
  }

  void pass() {
    setState(() {
      _currentCard.successCard();
      _currentCard = widget.backend.getNextCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(), // To align CardWidget to center
          CardWidget(card: _currentCard),
          ButtonRow(
            fail: fail,
            pass: pass,
          )
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Card card;

  const CardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            card.emoji,
            style: const TextStyle(
              fontSize: 64,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              card.getFormattedText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
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
  final Function fail;
  final Function pass;

  const ButtonRow({super.key, required this.fail, required this.pass});

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
          CustomOutlineButton(
            text: "FAIL",
            color: Colors.red,
            onPressed: () => widget.fail(),
          ),
          Container(width: 12),
          CustomOutlineButton(
            text: "NEXT",
            color: Colors.green,
            onPressed: () => widget.pass(),
          ),
        ],
      ),
    );
  }
}
