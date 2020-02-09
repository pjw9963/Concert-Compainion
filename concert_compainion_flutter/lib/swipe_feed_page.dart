import 'package:flutter/material.dart';
import 'cards_section_draggable.dart';
import 'profile_card_draggable.dart';

class SwipeFeedPage extends StatefulWidget {
  @override
  _SwipeFeedPageState createState() => _SwipeFeedPageState();
}

class _SwipeFeedPageState extends State<SwipeFeedPage> {

  List<ProfileCardDraggable> cards = List();
  int cardsCounter = 0;

  void changeCardsOrder() {
    setState(() {
      cards[0] = cards[1];
      cards[1] = cards[2];

      cards[2] = ProfileCardDraggable(cardsCounter);
      cardsCounter++;
    });
  }

  @override
  void initState() {
    super.initState();

    for (cardsCounter = 0; cardsCounter < 3; cardsCounter++) {
      cards.add(ProfileCardDraggable(cardsCounter));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Concert Companion"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              Navigator.pushNamed(context, '/swipe');
            },
          ),
          // action button
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.pushNamed(context, '/message');
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          CardsSectionDraggable(),
          buttonsRow()
        ],
      ),
    );
  }

  Widget buttonsRow() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 48.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(right: 8.0)),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              //api call to report unwanted user
              //also update ui to remove current card
            },
            backgroundColor: Colors.white,
            child: Icon(Icons.close, color: Colors.red, size: 40,),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
            FloatingActionButton(
              heroTag: "btn3",
              onPressed: () {
                //api post call to report wanted friend
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite, color: Colors.green, size: 40,),
            ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
        ],
      ),
    );
  }
}
