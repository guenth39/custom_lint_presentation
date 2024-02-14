# sxb_lint | Some example custom lints for the flutter sxb meetup

For a detailed explanation of the usage of `custom_lint` have a look at the [package documentation](https://pub.dev/packages/custom_lint).

- [sxb\_lint | Some example custom lints for the flutter sxb meetup](#sxb_lint--some-example-custom-lints-for-the-flutter-sxb-meetup)
  - [Adding a new rule](#adding-a-new-rule)
    - [Debugging](#debugging)
  - [Adding a new assist](#adding-a-new-assist)
  - [Usage](#usage)
  - [Snippets](#snippets)

## Adding a new rule

1. Add a new file in the `lint` folder.
2. The file name should be the name of the rule (snake_case).
3. Start typing `lint_rule` to have the option to let vs code insert a template for you.
4. Add the lint rule to the `lib/package_name.dart` file.
5. Add a test in `example/lib/lint/rule_name_test.dart`
   1. To test the rule you can add a `expect_lint: rule_name` comment where the lint should be triggered.
6. Customize the template code as required.
7. Add a fix if possible.

### Debugging

It's possible to attach to the `custom_lint` process with your IDE to debug the rule.
See the [custom_lint docs](https://pub.dev/packages/custom_lint#using-the-dart-debugger) for details.

**WARNING**
Attaching to a dart process is sometimes a little buggy.
This can be due to many different things.
Please do not get frustrated and use a simple print statement for debugging instead.

## Adding a new assist

1. Add a new file in the `assist` folder.
2. The file name should be the name of the assist (snake_case).
3. Start typing `assist` to have the option to let vs code insert a template for you.
4. Add the assist to the `lib/package_name.dart` file.
5. Add a test in `example/lib/assist/assist_name_test.dart`
6. Customize the template code as required.

## Usage

To add the rules to your project follow the following steps:

- The application must contain an `analysis_options.yaml` with the following:

  ```yaml
  analyzer:
    plugins:
      - custom_lint
  ```

- The application also needs to add `custom_lint` and our package as dev
  dependency in their application:

  ```yaml
  # The pubspec.yaml of an application using our lints
  name: example_app
  environment:
    sdk: ">=2.16.0 <3.0.0"

  dev_dependencies:
    custom_lint:
    package_name:
  ```

That's all!
After running `pub get` (and possibly restarting the IDE), you should now
see our custom lints in the Dart files.

More infos in the [custom_lint documentation](https://pub.dev/packages/custom_lint#using-our-custom-lint-package-in-an-application).

## Snippets

The code snippets are stored under `.vscode/lint.code-snippets` in the root of the repo as it's not possible to deliver them in the package folder.
They can be used to quickly create a new lint rule or assist.
