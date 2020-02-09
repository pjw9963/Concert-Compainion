import 'profile_card_draggable.dart';

class Cards {

  List<ProfileCardDraggable> cards = List();
  int cardsCounter = 0;

  Cards() {
    for (cardsCounter = 0; cardsCounter < 3; cardsCounter++) {
      cards.add(ProfileCardDraggable(cardsCounter));
    }
  }

   changeCardsOrder(bool choice) {

     choice ? print("good") : print("bad");

      cards[0] = cards[1];
      cards[1] = cards[2];

      cards[2] = ProfileCardDraggable(cardsCounter);
      cardsCounter++;
  }

}