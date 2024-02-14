import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:change_case/change_case.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class WrongRouteName extends DartLintRule {
  const WrongRouteName() : super(code: _code);

  static const _code = LintCode(
    name: 'wrong_route_name',
    problemMessage:
        'The FlutterDeckSlideConfiguration route should be named after the class name in kebab case.',
    correctionMessage:
        'Change the route to be named after the class name in kebab case.',
  );

  @override
  List<Fix> getFixes() => [_WrongRouteNameFix()];

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // Limitation: For simplicity, this lint assumes that there is only one
    // FlutterDeckSlideWidget per file!

    // Store the class name of the FlutterDeckSlideWidget
    late String className;
    context.registry.addClassDeclaration((node) {
      // This lint only applies to classes that extend FlutterDeckSlideWidget
      final extendsFlutterDeckSlideWidget =
          node.extendsClause?.superclass.name2.toString() ==
              'FlutterDeckSlideWidget';
      if (!extendsFlutterDeckSlideWidget) {
        return;
      }

      className = node.name.lexeme;
    });

    context.registry.addSuperConstructorInvocation((node) {
      final route = _getRouteFromDeckSlideSuperInvocation(node);
      final routeName = (route.expression as StringLiteral).stringValue;

      final expectedRouteName = '/${className.toKebabCase()}';

      // This lint only applies to classes that don't contain `Slide` in their name
      if (routeName == expectedRouteName) {
        return;
      }

      reporter.reportErrorForNode(
        _code,
        route,
        null, null,
        // Pass the expected route name as a detail to the error message so we
        // cyan reuse it in the fix.
        expectedRouteName,
      );
    });
  }
}

class _WrongRouteNameFix extends DartFix {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) {
    context.registry.addSuperConstructorInvocation((node) {
      if (!analysisError.sourceRange.intersects(node.sourceRange)) {
        // Return early if the error is not on this node.
        return;
      }

      final route = _getRouteFromDeckSlideSuperInvocation(node);

      final newRouteName = analysisError.data as String;

      reporter.createChangeBuilder(
        message: 'Rename route to `$newRouteName`.',
        priority: 100,
      )..addDartFileEdit(
          (builder) => builder
            ..addSimpleReplacement(
                route.expression.sourceRange, "'$newRouteName'"),
        );
    });
  }
}

NamedExpression _getRouteFromDeckSlideSuperInvocation(
  SuperConstructorInvocation node,
) {
  final configuration = node.argumentList.arguments.first as NamedExpression;
  final expression = configuration.expression as InstanceCreationExpression;
  final route = expression.argumentList.arguments.firstWhere((argument) =>
          argument is NamedExpression && argument.name.label.name == 'route')
      as NamedExpression;
  return route;
}
