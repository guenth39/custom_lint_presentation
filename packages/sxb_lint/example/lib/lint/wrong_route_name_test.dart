import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class GoodSlide extends FlutterDeckSlideWidget {
  const GoodSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/good-slide',
            title: _title,
            header: FlutterDeckHeaderConfiguration(title: _title),
          ),
        );

  static const _title = 'Good Slide';

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.bigFact(
        title: "This is a good slide",
      );
}

class BadSlide extends FlutterDeckSlideWidget {
  const BadSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            // expect_lint: wrong_route_name
            route: '/bad',
            title: _title,
            header: FlutterDeckHeaderConfiguration(title: _title),
          ),
        );

  static const _title = 'Bad Slide';

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.bigFact(
        title: "This is a bad slide",
      );
}
