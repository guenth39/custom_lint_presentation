import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class SwapTernaryConditions extends DartAssist {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    SourceRange target,
  ) {
    context.registry.addConditionalExpression((node) {
      // Check that the visited node is under the cursor
      if (!target.intersects(node.sourceRange)) {
        return;
      }

      final newThenExpression = node.elseExpression;
      final newElseExpression = node.thenExpression;

      reporter
          .createChangeBuilder(
            message: 'Swap if and else condition',
            priority: 100,
          )
          .addDartFileEdit(
            (builder) => builder
              ..addSimpleReplacement(
                node.elseExpression.sourceRange,
                newElseExpression.toSource(),
              )
              ..addSimpleReplacement(
                node.thenExpression.sourceRange,
                newThenExpression.toSource(),
              )
              ..format(node.sourceRange),
          );
    });
  }
}
