import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:sxb_lint/lint/wrong_name_on_slide.dart';
import 'package:sxb_lint/lint/wrong_route_name.dart';

import 'assist/swap_ternary_conditions.dart';

// This is the entrypoint of our custom linter
PluginBase createPlugin() => _SxbLinter();

class _SxbLinter extends PluginBase {
  @override
  List<Assist> getAssists() => [
        SwapTernaryConditions(),
      ];

  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        WrongNameOnSlide(),
        WrongRouteName(),
      ];
}
