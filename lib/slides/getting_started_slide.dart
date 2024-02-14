import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class GettingStarted extends FlutterDeckSlideWidget {
  const GettingStarted()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/getting-started',
            title: _title,
            header: FlutterDeckHeaderConfiguration(title: _title),
          ),
        );

  static const _title = 'Getting started';

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.bigFact(
        title: "Let's try it out!",
      );
}
