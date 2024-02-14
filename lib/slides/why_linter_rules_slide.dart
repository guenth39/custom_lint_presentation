import 'package:custom_lint_presentation/custom_lint_deck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WhyLinterRulesSlide extends FlutterDeckSlideWidget {
  const WhyLinterRulesSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/why-linter-rules',
            title: _title,
            header: FlutterDeckHeaderConfiguration(title: _title),
          ),
        );

  static const _title = 'Why should we use linter rules?';

  // Consistency: Linter rules enforce consistent coding styles and conventions
  // across the entire codebase. This consistency makes the code easier to read,
  // understand, and maintain, especially when multiple developers are working on
  // the same project.
  //
  // Code Quality: Linter rules help improve overall code quality by identifying
  // potential issues, such as syntax errors, coding mistakes, or violations of
  // best practices, early in the development process. Addressing these issues
  // promptly leads to cleaner, more reliable code.
  //
  // Maintainability: Consistently formatted and high-quality code is easier to
  // maintain over time. Linter rules encourage practices that contribute to
  // better code organization, modularization, and documentation, making it easier
  // for developers to update, refactor, and extend the codebase.
  //
  // Reduced Bugs and Errors: By catching common programming mistakes and
  // enforcing coding standards, linter rules help reduce the likelihood of bugs
  // and errors in the code. This leads to more robust and reliable software
  // applications, enhancing user satisfaction and trust.
  //
  // Team Collaboration: Linter rules serve as a common set of guidelines for
  // developers working on the same project, fostering better collaboration and
  // communication within the team. Consistent coding styles and practices make it
  // easier for team members to review each other's code and provide feedback
  // effectively.
  //
  // Learning and Education: Linter rules can serve as educational tools for
  // developers, especially those new to a programming language or framework. By
  // following established best practices enforced by linter rules, developers can
  // learn and adopt good coding habits more easily, improving their skills over
  // time.
  @override
  FlutterDeckSlide build(BuildContext context) => FlutterDeckSlide.blank(
        builder: (context) => Padding(
          padding: CustomLintDeck.getDefaultPadding(context),
          child: FlutterDeckBulletList(
            items: const [
              'Consistency',
              'Code Quality',
              'Maintainability',
              'Reduced Bugs and Errors',
              'Team Collaboration',
              'Learning and Education',
            ],
          ),
        ),
      );
}
