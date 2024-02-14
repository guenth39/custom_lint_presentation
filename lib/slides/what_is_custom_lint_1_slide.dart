import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WhatIsCustomLint1 extends FlutterDeckSlideWidget {
  const WhatIsCustomLint1()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/what-is-custom-lint1',
            title: _title,
            header: FlutterDeckHeaderConfiguration(title: _title),
          ),
        );
  static const _title = 'What is Custom Lint?';

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.bigFact(
        title: 'Tools for building custom lint rules.',
        subtitle:
            'Custom_lint is similar to analyzer_plugin, but goes deeper by '
            'trying to provide a better developer experience.',
        subtitleMaxLines: 5,
      );
}
