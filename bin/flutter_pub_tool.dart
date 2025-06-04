import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addFlag('help',abbr: 'h', negatable: false, help: 'Show usage help');
  final ArgResults results = parser.parse(arguments);

  if (results['help']) {
    print('📦 flutter_dependency_tracker');
    print(parser.usage);
    return;
  }
}
