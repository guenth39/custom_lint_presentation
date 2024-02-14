import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FinalSlide extends FlutterDeckSlideWidget {
  const FinalSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/final-slide',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.title(
        title: 'Thank you all for your time and attention!',
        subtitle: 'Keep Calm and Lint On 🚀',
      );
}
