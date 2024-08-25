import 'package:card_swiper_app/candidate_model.dart';
import 'package:card_swiper_app/example_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CardSwiperController controller;
  @override
  void initState() {
    controller = CardSwiperController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cards = candidates.map(ExampleCard.new).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: CardSwiper(
                  controller: controller,
                  onSwipe: _onSwipe,
                  cardsCount: cards.length,
                  cardBuilder: (context, index, horizontalOffsetPercentage,
                          verticalOffsetPercentage) =>
                      cards[index],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: controller.undo,
                      child: const Icon(Icons.rotate_left),
                    ),
                    FloatingActionButton(
                      onPressed: () =>
                          controller.swipe(CardSwiperDirection.left),
                      child: const Icon(Icons.keyboard_arrow_left),
                    ),
                    FloatingActionButton(
                      onPressed: () =>
                          controller.swipe(CardSwiperDirection.top),
                      child: const Icon(Icons.keyboard_arrow_up),
                    ),
                    FloatingActionButton(
                      onPressed: () =>
                          controller.swipe(CardSwiperDirection.bottom),
                      child: const Icon(Icons.keyboard_arrow_down),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
