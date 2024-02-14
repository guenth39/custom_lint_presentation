import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class WrongNameOnSlide extends DartLintRule {
  const WrongNameOnSlide() : super(code: _code);

  static const _code = LintCode(
    name: 'wrong_name_on_slide',
    problemMessage: 'Flutter Deck slides should contain `Slide`',
    correctionMessage: 'Rename the class to contain `Slide`',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addClassDeclaration((node) {
      // This lint only applies to classes that extend FlutterDeckSlideWidget
      final extendsFlutterDeckSlideWidget =
          node.extendsClause?.superclass.name2.toString() ==
              'FlutterDeckSlideWidget';
      if (!extendsFlutterDeckSlideWidget) {
        return;
      }

      // This lint only applies to classes that don't contain `Slide` in their name
      final className = node.name.lexeme;
      final containsSlide = className.toLowerCase().contains('slide');
      if (containsSlide) {
        return;
      }

      // // Would report the error on the entire node instead of just the name
      // reporter.reportErrorForNode(
      //   _code,
      //   node,
      // );
      reporter.reportErrorForToken(
        _code,
        node.name,
      );
    });
  }
}
