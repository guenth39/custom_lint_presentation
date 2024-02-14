import 'package:custom_lint_presentation/slides/cover_slide.dart';
import 'package:custom_lint_presentation/slides/final_slide.dart';
import 'package:custom_lint_presentation/slides/getting_started_slide.dart';
import 'package:custom_lint_presentation/slides/limitations_slide.dart';
import 'package:custom_lint_presentation/slides/upcoming_slide.dart';
import 'package:custom_lint_presentation/slides/what_is_custom_lint_1_slide.dart';
import 'package:custom_lint_presentation/slides/what_is_custom_lint_2_slide.dart';
import 'package:custom_lint_presentation/slides/why_linter_rules_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class CustomLintDeck extends StatelessWidget {
  const CustomLintDeck({
    super.key,
  });

  static EdgeInsets getDefaultPadding(
    BuildContext context, {
    bool horizontal = true,
    bool vertical = true,
  }) =>
      EdgeInsets.symmetric(
        horizontal: horizontal ? MediaQuery.of(context).size.width * .1 : 0,
        vertical: vertical ? MediaQuery.of(context).size.height * .1 : 0,
      );

  @override
  Widget build(BuildContext context) => FlutterDeckApp(
        slides: const [
          CoverSlide(),
          WhyLinterRulesSlide(),
          WhatIsCustomLint1(),
          WhatIsCustomLint2(),
          GettingStarted(),
          Limitations(),
          Upcoming(),
          FinalSlide(),
        ],
        themeMode: ThemeMode.dark,
        speakerInfo: const FlutterDeckSpeakerInfo(
          name: 'Micha Günther',
          description: 'Flutter Developer @ Loql',
          socialHandle: '',
          imagePath: 'assets/me.png',
        ),
        configuration: FlutterDeckConfiguration(
          transition: const FlutterDeckTransition.fade(),
          showProgress: false,
          header: const FlutterDeckHeaderConfiguration(
            showHeader: true,
            title: 'Unleashing Dart Custom Lint',
          ),
          footer: const FlutterDeckFooterConfiguration(
            showFooter: true,
            showSlideNumbers: true,
          ),
          background: FlutterDeckBackgroundConfiguration(
            dark: FlutterDeckBackground.solid(
                Theme.of(context).colorScheme.surface),
          ),
        ),
        darkTheme: FlutterDeckThemeData(
          theme: Theme.of(context),
          textTheme: FlutterDeckTextTheme(
            bodyMedium: Theme.of(context).textTheme.bodyMedium!,
            header: Theme.of(context).textTheme.displayLarge!,
            title: Theme.of(context).textTheme.displayMedium!.copyWith(
                  height: 1.8,
                ),
          ),
        ),
      );
}
