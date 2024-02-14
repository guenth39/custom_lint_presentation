import 'package:custom_lint_presentation/custom_lint_deck.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CustomLintPresentation());
}

class CustomLintPresentation extends StatelessWidget {
  CustomLintPresentation({super.key});

  final _colorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(10, 93, 158, 1),
    brightness: Brightness.dark,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Lint Presentation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: _colorScheme,
        textTheme: const TextTheme().apply(
          bodyColor: _colorScheme.onSurface,
        ),
      ),
      home: const CustomLintDeck(),
    );
  }
}
