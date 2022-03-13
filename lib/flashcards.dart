import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

Map flashcardQuestions = {
  1: 'What is the speed limit for an unmanned aircraft?',
  2: 'TFRs are typically issues for'
};
Map flashcardAnswers = {
  1: '87 knots; 100 mph',
  2: 'major events such as sporting events and presidential movements'
};
int index = 1;

class FlashcardsPage extends StatelessWidget {
  const FlashcardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash Cards'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FlipCard(
            fill: Fill
                .fillBack, // Fill the back side of the card to make in the same size as the front.
            direction: FlipDirection.HORIZONTAL, // default
            front: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                    offset: Offset(0, -10), // shadow direction: bottom right
                  )
                ],
              ),
              width: 500,
              height: 300,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  flashcardQuestions[index],
                  style: TextStyle(),
                ),
              ),
            ),
            back: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              width: 500,
              height: 300,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  flashcardAnswers[index],
                  style: TextStyle(),
                ),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            OutlinedButton.icon(
                onPressed: previousCard,
                icon: Icon(Icons.chevron_left),
                label: Text('Prev')),
            OutlinedButton.icon(
                onPressed: nextCard,
                icon: Icon(Icons.chevron_right),
                label: Text('Next')),
          ])
        ]),
      ),
    );
  }
}

void nextCard() {
  print(index);
}

void previousCard() {
  print(index);
}
