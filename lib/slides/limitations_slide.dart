import 'package:custom_lint_presentation/custom_lint_deck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class Limitations extends FlutterDeckSlideWidget {
  const Limitations()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/limitations',
            title: _title,
            header: FlutterDeckHeaderConfiguration(title: _title),
          ),
        );
  static const _title = 'Limitations';

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.split(
        leftBuilder: (context) => Padding(
          padding: CustomLintDeck.getDefaultPadding(context, horizontal: false),
          child: FlutterDeckBulletList(
            items: const [
              'In the moment only one analyzer plugin can be used at a time',
            ],
          ),
        ),
        rightBuilder: (context) => const FlutterDeckCodeHighlight(
          code: '''
// analysis_options.yaml


analyzer:
  plugins:
    - custom_lint
    // Not possible at at the moment
    // Tracked at https://github.com/dart-lang/sdk/issues/50981
    - dart_code_metrics
''',
        ),
      );
}
