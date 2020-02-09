import 'package:flutter/material.dart';
import 'profile_card_draggable.dart';
import 'Cards.dart';

class CardsSectionDraggable extends StatefulWidget {

  Cards myCards;

  CardsSectionDraggable(Cards cards) {
    myCards = cards;
  }

  @override
  _CardsSectionState createState() => _CardsSectionState();
}

class _CardsSectionState extends State<CardsSectionDraggable> {
  bool dragOverTarget = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
      children: <Widget>[
        // Drag target row
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            dragTarget(false),
            Flexible(flex: 2, child: Container()),
            dragTarget(true)
          ],
        ), // Back card
        Align(
          alignment: Alignment(0.0, 1.0),
          child: IgnorePointer(
              child: SizedBox.fromSize(
            size: Size(MediaQuery.of(context).size.width * 0.8,
                MediaQuery.of(context).size.height * 0.5),
            child: widget.myCards.cards[2],
          )),
        ),
        // Middle card
        Align(
          alignment: Alignment(0.0, 0.8),
          child: IgnorePointer(
              child: SizedBox.fromSize(
            size: Size(MediaQuery.of(context).size.width * 0.85,
                MediaQuery.of(context).size.height * 0.55),
            child: widget.myCards.cards[1],
          )),
        ),
        // Front card
        Align(
          alignment: Alignment(0.0, 0.0),
          child: Draggable(
            feedback: SizedBox.fromSize(
              size: Size(MediaQuery.of(context).size.width * 0.9,
                  MediaQuery.of(context).size.height * 0.6),
              child: widget.myCards.cards[0],
            ),
            child: SizedBox.fromSize(
              size: Size(MediaQuery.of(context).size.width * 0.9,
                  MediaQuery.of(context).size.height * 0.6),
              child: widget.myCards.cards[0],
            ),
            childWhenDragging: Container(),
          ),
        ),
      ],
    ));
  }

  void changeCardsOrder(bool choice) {
    setState(() {
      widget.myCards.changeCardsOrder(choice);
    });
  }

  Widget dragTarget(bool choice) {
    return Flexible(
      flex: 1,
      child: DragTarget(
          builder: (_, __, ___) {
            return Container();
          },
          onWillAccept: (_) {
            setState(() => dragOverTarget = true);
            return true;
          },
          onAccept: (_) {
            changeCardsOrder(choice);
            setState(() => dragOverTarget = false);
          },
          onLeave: (_) => setState(() => dragOverTarget = false)),
    );
  }
}
