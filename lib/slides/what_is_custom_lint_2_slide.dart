import 'package:custom_lint_presentation/custom_lint_deck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WhatIsCustomLint2 extends FlutterDeckSlideWidget {
  const WhatIsCustomLint2()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/what-is-custom-lint2',
            title: _title,
            header: FlutterDeckHeaderConfiguration(title: _title),
          ),
        );
  static const _title = 'What is Custom Lint?';

  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.blank(
        builder: (context) => Padding(
          padding: CustomLintDeck.getDefaultPadding(context),
          child: FlutterDeckBulletList(
            items: const [
              'Framework for building your own lint package',
              'Easier to use wrapper around the analyzer_plugin',
              'Gives us the ability to build our own lint rules and fixes',
              'Developed and maintained by the renowned team of invertase.io '
                  '(melos, Zapp) and @rrousselGit (provider, hooks, '
                  'riverpod, freezed)',
            ],
          ),
        ),
      );
}
