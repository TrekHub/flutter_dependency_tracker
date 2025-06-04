

import 'package:args/args.dart';
import 'package:flutter_pub_tool/services/pubspec_parser_service.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Show usage help')
    ..addFlag('tree', help: 'Print full dependency tree');
  final ArgResults results = parser.parse(arguments);

  if (results['help']) {
    print('📦 flutter_dependency_tracker');
    print(parser.usage);
    return;
  }

  if (results['tree']) {
    final pubspecTree = PubspecParserService().parsePubspecFile('pubspec.yaml');
    print('🧩 Dependencies: ${pubspecTree.dependencies}');
    print('🛠 Dev Dependencies: ${pubspecTree.devDependencies}');
  }
}
