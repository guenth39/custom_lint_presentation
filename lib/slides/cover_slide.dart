import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class CoverSlide extends FlutterDeckSlideWidget {
  const CoverSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/cover-slide',
            title: 'Cover',
            header: FlutterDeckHeaderConfiguration(
              showHeader: false,
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.title(
        title: 'Unleashing Dart Custom Lint',
        subtitle: 'Elevate Your Code Quality',
      );
}
