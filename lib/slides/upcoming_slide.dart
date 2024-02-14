import 'package:custom_lint_presentation/custom_lint_deck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Upcoming extends FlutterDeckSlideWidget {
  const Upcoming()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/upcoming',
            title: _title,
            header: FlutterDeckHeaderConfiguration(title: _title),
          ),
        );
  static const _title = 'Upcoming';

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.split(
        leftBuilder: (context) => Padding(
          padding: CustomLintDeck.getDefaultPadding(context, horizontal: false),
          child: FlutterDeckBulletList(
            items: const [
              // https://github.com/invertase/dart_custom_lint/issues/161
              'Fix all option',
              'Apply fixes by command line',
            ],
          ),
        ),
        rightBuilder: (context) => Image.asset('assets/fix_all.gif'),
      );
}
